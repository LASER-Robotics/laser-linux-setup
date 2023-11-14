# - make the script run in bash/zsh while having its dotfile sourced
# - this is important when there are variables exported, which might
#   be used by this script
PNAME=$( ps -p "$$" -o comm= )
SNAME=$( echo "$SHELL" | grep -Eo '[^/]+/?$' )
if [ "$PNAME" != "$SNAME" ]; then
  exec "$SHELL" "$0" "$@"
  exit "$?"
else
  source ~/."$SNAME"rc
fi

var=`lsb_release -r | awk '{ print $2 }'`
[ "$var" = "22.04" ] && export JAMMY=1

if [ -n "$JAMMY" ]; then
  ./submodules/profile_manager/profile_manager.sh deploy ./appconfig/profile_manager/file_list_22.txt
else
  ./submodules/profile_manager/profile_manager.sh deploy ./appconfig/profile_manager/file_list.txt
fi
