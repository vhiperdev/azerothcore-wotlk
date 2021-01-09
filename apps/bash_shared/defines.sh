unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
   if ! command -v brew &>/dev/null ; then
       ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   fi
   if ! [ "${BASH_VERSINFO}" -ge 4 ]; then
       brew install bash
   fi
   if ! command -v greadlink &>/dev/null ; then
       brew install coreutils
   fi
   AC_PATH_ROOT=$(greadlink -f "$AC_PATH_APPS/../")
else
   AC_PATH_ROOT=$(readlink -f "$AC_PATH_APPS/../")
fi

AC_PATH_CONF="$AC_PATH_ROOT/conf"

AC_PATH_MODULES="$AC_PATH_ROOT/modules"

AC_PATH_DEPS="$AC_PATH_ROOT/deps"
