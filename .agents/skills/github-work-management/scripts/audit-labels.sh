#!/usr/bin/env bash
set -euo pipefail

if (( $# != 2 )); then
  echo "usage: audit-labels.sh OWNER/REPO LABELS_YML" >&2
  exit 2
fi

repo=$1
labels_file=$2
command -v gh >/dev/null
command -v jq >/dev/null
command -v yq >/dev/null

expected=$(mktemp)
actual=$(mktemp)
trap 'rm -f "$expected" "$actual"' EXIT

yq -o=json '.labels' "$labels_file" | jq -S 'map({name, color: (.color | ascii_upcase), description}) | sort_by(.name)' > "$expected"
gh api "repos/$repo/labels?per_page=100" | jq -S 'map({name, color: (.color | ascii_upcase), description}) | sort_by(.name)' > "$actual"

jq -n --slurpfile expected "$expected" --slurpfile actual "$actual" '{missing: ($expected[0] - $actual[0]), unexpected: ($actual[0] - $expected[0])}'
