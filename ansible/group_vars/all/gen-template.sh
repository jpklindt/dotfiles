#!/usr/bin/env bash
# Regenerate vault.yml.template from the real vault.yml.
# Replaces every value with a self-documenting YOUR_<KEY> placeholder 
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
vault="$here/vault.yml"
template="$here/vault.yml.template"

[[ -f "$vault" ]] || { echo "vault not found: $vault" >&2; exit 1; }

if head -c 15 "$vault" | grep -q '^\$ANSIBLE_VAULT'; then
  read_vault() { ansible-vault view "$vault"; }
else
  read_vault() { cat "$vault"; }
fi

read_vault | awk '
  /^[[:space:]]*$/ || /^[[:space:]]*#/ { print; next }        # blanks & comments
  match($0, /^[[:space:]]*[A-Za-z0-9_]+[[:space:]]*:/) {       # key: value
    head = substr($0, 1, RLENGTH)                              # indent + key + ":"
    key  = head; sub(/^[[:space:]]*/, "", key); sub(/[[:space:]]*:$/, "", key)
    ph = toupper(key); sub(/^VAULT_/, "", ph)
    printf "%s \"YOUR_%s\"\n", head, ph; next
  }
  { print }                                                    # anything else verbatim
' > "$template"

echo "Wrote $template"