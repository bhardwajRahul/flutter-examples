#!/usr/bin/env bash
set -euo pipefail

# Regenerates documentation/EXAMPLES.md from the example app folders on disk.
# Run via `make docs` after adding or removing an example app.

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

OUT="documentation/EXAMPLES.md"

# Apps that demonstrate multiple features and are listed separately.
COMPLETE_APPS=(
	covid19_mobile_app
	bmi_calculator
	expense_planner
	using_firebase_db
	tip_calculator
)

# Folder -> display title overrides for non-obvious names.
declare -A TITLES=(
	[statless_counter_app]="Stateless Counter App"
	[sliver_app_bar_example]="Sliver App Bar"
	[using_listwheelscrollview]="Using ListWheelScrollView"
)

title_from_folder() {
	local folder="$1"
	if [ -n "${TITLES[$folder]:-}" ]; then
		echo "${TITLES[$folder]}"
		return
	fi
	local words
	words=$(echo "$folder" | tr '_' ' ')
	local out=""
	for w in $words; do
		case "$w" in
			sqlite) w="SQLite" ;;
			json) w="JSON" ;;
			http) w="HTTP" ;;
			pdf) w="PDF" ;;
			qr) w="QR" ;;
			getx) w="GetX" ;;
		esac
		out="$out ${w^}"
	done
	echo "${out# }"
}

is_complete_app() {
	local folder="$1"
	local candidate
	for candidate in "${COMPLETE_APPS[@]}"; do
		[ "$candidate" = "$folder" ] && return 0
	done
	return 1
}

apps=()
for dir in ./*; do
	if [ -f "$dir/pubspec.yaml" ]; then
		apps+=("$(basename "$dir")")
	fi
done
IFS=$'\n' apps=($(sort <<<"${apps[*]}")); unset IFS

{
	echo "# Example Apps"
	echo ""
	echo "Each folder in this repository is a standalone Flutter example app."
	echo ""
	echo "## Individual examples"
	echo ""
	local_apps=()
	for app in "${apps[@]}"; do
		if ! is_complete_app "$app"; then
			local_apps+=("$app")
		fi
	done
	for app in "${local_apps[@]}"; do
		echo "1. [$(title_from_folder "$app")](/$app)"
	done
	echo ""
	echo "## Complete apps with multiple features"
	echo ""
	for app in "${COMPLETE_APPS[@]}"; do
		echo "1. [$(title_from_folder "$app")](/$app)"
	done
	echo ""
} > "$OUT"

echo "  Regenerated $OUT with ${#apps[@]} apps."