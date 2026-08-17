#!/usr/bin/env bash
set -euo pipefail

# Runs `flutter analyze` in every example app and reports the results.
# Exits non-zero if any app has analyzer issues.

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

clean=0
issues=0
failed=0
apps_with_issues=()

analyze_app() {
	local dir="$1"
	local app
	app=$(basename "$dir")

	local out
	if ! out=$(cd "$dir" && flutter analyze 2>&1); then
		failed=$((failed + 1))
		return
	fi

	local summary
	summary=$(echo "$out" | tail -1)
	if echo "$out" | grep -q "No issues found"; then
		clean=$((clean + 1))
	else
		issues=$((issues + 1))
		apps_with_issues+=("$app")
		printf "  %-30s %s\n" "$app" "$summary"
	fi
}

separator
echo "  Running flutter analyze for all Flutter apps:"
for_each_app pubspec.yaml analyze_app
separator
printf "  %-16s %s\n" "Clean:" "$clean"
printf "  %-16s %s\n" "With issues:" "$issues"
printf "  %-16s %s\n" "Failed to run:" "$failed"
if [ "${#apps_with_issues[@]}" -gt 0 ]; then
	echo "  Apps with issues:"
	printf "    %s\n" "${apps_with_issues[@]}"
fi
separator

[ "$issues" -eq 0 ] && [ "$failed" -eq 0 ]