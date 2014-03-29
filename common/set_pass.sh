ACCOUNT=$1
PASS=$2
exec echo "$PASS" | gpg --use-agent -e > ~/.passwd/$ACCOUNT.gpg
#path = "/usr/local/google/home/tzn/.passwd/%s.gpg" % account
#  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
