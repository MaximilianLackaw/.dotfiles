# Setup clipboard aliases:
# - ccopy: copy to clipboard (clip.exe for WSL, wl-copy, pbcopy)
# - cpaste: paste from clipboard (powershell Get-Clipboard for WSL, wl-paste, pbpaste)
# - pwdc: copy current path
# - pwdcw: copy current path in Windows format (only in WSL if wslpath exists)

function setup_clipboard_tools() {
  # Check for WSL
  local is_wsl=false
  if grep -qi microsoft /proc/version 2>/dev/null; then
    is_wsl=true
  fi

  # Set clipboard commands based on environment
  if $is_wsl && command -v clip.exe &> /dev/null; then
    alias ccopy="clip.exe"
    alias cpaste="powershell.exe Get-Clipboard"
  elif command -v wl-copy &> /dev/null; then
    alias ccopy="wl-copy"
    alias cpaste="wl-paste"
  elif command -v pbcopy &> /dev/null; then
    alias ccopy="pbcopy"
    alias cpaste="pbpaste"
  fi

  # Set pwdc alias for copying current path
  if command -v ccopy &> /dev/null; then
    alias pwdc='pwd | ccopy'

    # Only for WSL, convert path to Windows format
    if $is_wsl && command -v wslpath &> /dev/null; then
      function pwdcw() {
        wslpath -w "$(pwd)" | clip.exe
      }
    fi
  fi
}

setup_clipboard_tools

