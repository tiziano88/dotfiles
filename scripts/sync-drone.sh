#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

# Sync files from drone folder to remote server.
# Dry-run by default. Pass --go to actually transfer.

LOCAL_SRC="/Users/tzn/Documents/drone"
REMOTE_HOST="tzn@192.168.4.38"
REMOTE_BASE="/media/tzn/Expansion/drone"

DRY_RUN=true
if [[ "${1:-}" == "--go" ]]; then
    DRY_RUN=false
fi

# Verify source directory exists
if [[ ! -d "$LOCAL_SRC" ]]; then
    echo "ERROR: Source directory not found at $LOCAL_SRC"
    exit 1
fi

rsync_args=(--archive -vv --human-readable --ignore-existing)
if $DRY_RUN; then
    rsync_args+=(--dry-run)
    echo "=== DRY RUN (pass --go to actually transfer) ==="
else
    rsync_args+=(--partial --progress)
    echo "=== Transferring files... ==="
fi

rsync "${rsync_args[@]}" "$LOCAL_SRC/" "$REMOTE_HOST:$REMOTE_BASE/"
