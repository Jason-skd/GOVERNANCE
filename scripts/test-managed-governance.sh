#!/usr/bin/env bash
set -euo pipefail

# === 创建临时目标仓库 ===
source_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
test_root=$(mktemp -d)
trap 'rm -rf "$test_root"' EXIT

target_root="$test_root/target"
mkdir -p "$target_root"
git -C "$target_root" init --quiet

# === 初始化并检查托管文件 ===
"$source_root/.agents/skills/repository-bootstrap/scripts/bootstrap.sh" \
  "$source_root" "$target_root" go-library >/dev/null

while IFS= read -r path; do
  [[ -z "$path" || "$path" == "#"* ]] && continue
  test -f "$target_root/$path"
done < "$source_root/managed-files.txt"

test -x "$target_root/.agents/skills/governance-sync/scripts/sync.sh"
test -x "$target_root/.agents/skills/github-work-management/scripts/audit-labels.sh"
test -x "$target_root/.agents/skills/repository-bootstrap/scripts/bootstrap.sh"

# === 验证同步保留本地补充 ===
supplement="$target_root/docs/governance/repository.md"
supplement_digest=$(shasum -a 256 "$supplement" | cut -d ' ' -f 1)

printf '\n' >> "$target_root/AGENTS.md"
"$target_root/.agents/skills/governance-sync/scripts/sync.sh" \
  "$source_root" "$target_root" --apply >/dev/null

cmp "$source_root/AGENTS.md" "$target_root/AGENTS.md"
test "$supplement_digest" = "$(shasum -a 256 "$supplement" | cut -d ' ' -f 1)"
"$target_root/.agents/skills/governance-sync/scripts/sync.sh" \
  "$source_root" "$target_root" | grep -q 'managed baseline is current'

printf 'managed governance workflows passed\n'
