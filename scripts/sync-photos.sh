#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

# Sync photos from SD card to remote server, organized by date.
# Dry-run by default. Pass --go to actually transfer.

LOCAL_SRC="/Volumes/NO NAME/DCIM"
REMOTE_HOST="tzn@192.168.4.38"
REMOTE_BASE="/media/tzn/Expansion/photos_camera"

DRY_RUN=true
if [[ "${1:-}" == "--go" ]]; then
    DRY_RUN=false
fi

# Verify SD card is mounted
if [[ ! -d "$LOCAL_SRC" ]]; then
    echo "ERROR: SD card not found at $LOCAL_SRC"
    exit 1
fi

# Collect files grouped by date (scan all DCIM subfolders)
shopt -s nocaseglob nullglob
files=()
for subdir in "$LOCAL_SRC"/*/; do
    [[ -d "$subdir" ]] || continue
    subfiles=("$subdir"*.{jpg,jpeg,png,cr2,nef,arw})
    files+=("${subfiles[@]}")
done
shopt -u nocaseglob nullglob

if [[ ${#files[@]} -eq 0 ]]; then
    echo "No photo files found under $LOCAL_SRC"
    exit 0
fi

echo "Found ${#files[@]} files to sync"
echo ""

# Extract unique dates from all files
dates=()
for f in "${files[@]}"; do
    d=$(date -r "$f" +%Y-%m-%d)
    dates+=("$d")
done
unique_dates=($(printf '%s\n' "${dates[@]}" | sort --unique))

# Sync each date group
# In dry-run mode, rsync --verbose lists filenames that WOULD be transferred.
# Files already on the remote (matched by --ignore-existing) are silently skipped.
total_new=0
total_skipped=0

for d in "${unique_dates[@]}"; do
    remote_dir="$REMOTE_BASE/$d"

    # Collect files for this date
    group_files=()
    for i in "${!files[@]}"; do
        if [[ "${dates[$i]}" == "$d" ]]; then
            group_files+=("${files[$i]}")
        fi
    done

    echo "=== $d (${#group_files[@]} files) -> $remote_dir ==="

    # Create remote directory (idempotent)
    if $DRY_RUN; then
        echo "  [dry-run] would mkdir -p $remote_dir"
    else
        ssh "$REMOTE_HOST" "mkdir --parents '$remote_dir'"
    fi

    # Build rsync args
    rsync_args=(--archive --verbose --human-readable --ignore-existing)
    if $DRY_RUN; then
        rsync_args+=(--dry-run)
    else
        rsync_args+=(--partial --progress)
    fi

    # Stream rsync output live to the terminal while also capturing for counting
    _tmp=$(mktemp)
    rsync "${rsync_args[@]}" "${group_files[@]}" "$REMOTE_HOST:$remote_dir/" 2>&1 | tee "$_tmp"
    rsync_output=$(cat "$_tmp"); rm -f "$_tmp"

    # Count files that would be (or were) transferred
    new_count=$(echo "$rsync_output" | grep --count --ignore-case --extended-regexp '\.(jpg|jpeg|png|cr2|nef|arw)$' || true)
    skipped=$((${#group_files[@]} - new_count))
    total_new=$((total_new + new_count))
    total_skipped=$((total_skipped + skipped))

    echo ""
done

echo "--- Summary ---"
echo "  New (would copy): $total_new"
echo "  Already exist (skipped): $total_skipped"
echo ""
if $DRY_RUN; then
    echo "=== DRY RUN complete. Run with --go to transfer. ==="
else
    echo "=== Sync complete. ==="
fi
