#!/usr/bin/env bash
set -euo pipefail

# Runs `flutter test` in every example app that has a test directory.
# Exits non-zero if any test run fails.

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

passed=0
failed=0
skipped=0
failed_apps=()

run_tests() {
	local dir="$1"
	local app
	app=$(basename "$dir")

	if [ ! -d "$dir/test" ]; then
		skipped=$((skipped + 1))
		return
	fi

	if (cd "$dir" && flutter test >/dev/null 2>&1); then
		passed=$((passed + 1))
	else
		failed=$((failed + 1))
		failed_apps+=("$app")
	fi
}

separator
echo "  Running flutter test for all Flutter apps:"
for_each_app pubspec.yaml run_tests
separator
printf "  %-16s %s\n" "Passed:" "$passed"
printf "  %-16s %s\n" "Failed:" "$failed"
printf "  %-16s %s\n" "No tests:" "$skipped"
if [ "${#failed_apps[@]}" -gt 0 ]; then
	echo "  Failed apps:"
	printf "    %s\n" "${failed_apps[@]}"
fi
separator

[ "$failed" -eq 0 ]