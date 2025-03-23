# vsc - Open a directory or .code-workspace file in VS Code with smart defaults.
#
# Behavior:
# - If no argument is given, opens the current directory.
# - If a .code-workspace file is passed, opens it directly.
# - If a directory is passed:
#   - Looks for *.code-workspace files inside the .vscode subdirectory.
#   - Prefers a file matching the directory name (case-insensitive).
#   - Falls back to the first found .code-workspace file.
#   - If none found, opens the directory itself.
# - If the argument is invalid, shows an error.

_vsc() {
  # Determine the target (either the current directory or the provided argument)
  local target="${1:-.}"

  # If the provided target is a .code-workspace file, open it directly
  if [[ -f "$target" && "$target" == *.code-workspace ]]; then
    code "$target"
    return
  fi

  # Otherwise, assume it's a directory
  local target_dir="$target"

  # Check if the target directory exists
  if [ -d "$target_dir" ]; then
    # Get the directory name without the full path
    local dir_name
    dir_name=$(basename "$target_dir")

    # Search for all .code-workspace files inside the .vscode folder
    local workspace_files
    workspace_files=($(find "$target_dir/.vscode" -maxdepth 1 -iname "*.code-workspace" 2>/dev/null))

    # Check if any workspace files were found
    if [ ${#workspace_files[@]} -gt 0 ]; then
      # Try to find a workspace file matching the directory name (case-insensitive)
      local preferred_workspace=""
      for file in "${workspace_files[@]}"; do
        if [[ "$(basename "$file" .code-workspace)" =~ ^$dir_name$ ]]; then
          preferred_workspace="$file"
          break
        fi
      done

      # If a preferred workspace file was found, open it; otherwise, open the first found
      if [ -n "$preferred_workspace" ]; then
        code "$preferred_workspace"
      else
        code "${workspace_files[0]}"
      fi
    else
      # No workspace file found, open the directory
      code "$target_dir"
    fi
  else
    echo "Error: '$target' not found"
  fi
}

alias vsc=_vsc
