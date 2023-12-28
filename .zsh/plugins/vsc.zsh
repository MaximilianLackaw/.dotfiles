
# Simple VS Code start script
# Calling vsc with path -> open path in VS Code
# Calling vsc without any arguments -> open current dir in VS Code

_vsc() {
  if [ "$#" -lt 1 ]
  then code .
  else code $1
  fi
}

alias vsc=_vsc