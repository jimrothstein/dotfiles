---
name: zsh
description: Zsh scripting rules and best practices
---

# Zsh Scripting Rules

## Shebang

Always use `#!/usr/bin/env zsh` for portability. Never hardcode `/bin/zsh`.

```zsh
#!/usr/bin/env zsh
```

## Strict Mode

Enable strict mode in every script.

```zsh
#!/usr/bin/env zsh
set -euo pipefail
```

- `-e`: Exit on error
- `-u`: Error on unset variables
- `-o pipefail`: Return exit status of last failed pipe command

### Additional Zsh Options

Consider enabling these for stricter behavior:

```zsh
setopt NULL_GLOB      # Unmatched globs expand to nothing instead of the literal pattern
setopt CDABLE_VARS    # cd into directory stored in a variable
setopt NO_SHORT_LOOPS # Force full loop syntax (for/while/until required)
```

## Shellcheck

Run shellcheck on all scripts before committing. Use zsh-specific exclusions for bash-isms.

```zsh
shellcheck -e SC2034,SC2086 script.zsh
```

Common exclusions for zsh:
- SC2034: unused variables (zsh is more lenient with namespace)
- SC2086: quote splitting (zsh handles arrays differently)

## Quoting

Quote all variable expansions and command substitutions. Use arrays instead of word-splitting strings.

```zsh
# Good
"${var}"
files=("file1.txt" "file2.txt")
for f in "${files[@]}"; do
  process "$f"
done

# Use zsh array syntax for empty arrays
files=()

# Bad
$var
files="file1.txt file2.txt"
for f in $files; do
  process $f
done
```

## Functions

Define with `function` keyword or parentheses. Use `local` for variables.

```zsh
# Preferred zsh style
function my_function {
  local result
  result=$(some_command)
  echo "$result"
}

# Also valid
my_function() {
  local result
  result=$(some_command)
  echo "$result"
}
```

## Command Substitution

Use `$()` not backticks. Nests cleanly.

```zsh
# Good
output=$(ls "$dir")

# Bad
output=`ls $dir`
```

## Error Handling

Use `trap` for cleanup.

```zsh
cleanup() {
  rm -f /tmp/lockfile
}
trap cleanup EXIT
```

## Readability

- Use 2-space indentation
- Limit lines to 80 characters
- Add comments for non-obvious logic
- Separate sections with blank lines

## Zsh-Specific Notes

- Use `${var}` instead of `$var` for clarity and to avoid word splitting issues
- Array indices start at 1 in zsh (not 0)
- Use `${(@)}` parameter expansion flags for advanced array operations
- Prefer `print` over `echo` in zsh scripts for better portability
- Use `typeset` instead of `local` when declaring typed variables