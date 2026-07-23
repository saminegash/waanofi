#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────────────────
# check_color_usage.sh — CI guard that ensures no raw `Colors.*` references
# appear outside the single-source-of-truth colour file.
#
# Usage:  ./scripts/check_color_usage.sh
# Exit 0: Clean.  Exit 1: Violations found.
# ──────────────────────────────────────────────────────────────────────────────
set -euo pipefail

COLOR_FILE="lib/core/theme/waanofi_colors.dart"
SEARCH_DIR="lib"

echo "🔍 Scanning for disallowed Colors.* usage outside $COLOR_FILE ..."

# Grep for ` Colors.` or `(Colors.` — i.e. the Flutter Colors class, NOT WaanofiColors.
# Exclude generated files (*.g.dart, *.freezed.dart).
VIOLATIONS=$(grep -rn --include='*.dart' \
  --exclude='*.g.dart' \
  --exclude='*.freezed.dart' \
  -P '(?<![A-Za-z])Colors\.' "$SEARCH_DIR" \
  | grep -v "$COLOR_FILE" \
  | grep -v '// ignore-color-lint' \
  || true)

if [ -n "$VIOLATIONS" ]; then
  echo ""
  echo "❌  Found disallowed Colors.* references:"
  echo "$VIOLATIONS"
  echo ""
  echo "All raw colour values must live in $COLOR_FILE."
  echo "Use WaanofiColors.* tokens or Theme.of(context).colorScheme instead."
  echo ""
  echo "To suppress a specific line, add:  // ignore-color-lint"
  exit 1
fi

echo "✅  No disallowed Colors.* usage found."
exit 0
