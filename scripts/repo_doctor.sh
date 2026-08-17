#!/usr/bin/env bash
set -uo pipefail

# Reports repository drift across all example apps.
# Run after adding or modifying an app, or before a release.
# Exits non-zero if any issues are found.

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

STD_SDK='sdk: ">=3.0.0 <4.0.0"'
GRADLE_MODE="9.7.0"

issues=0

report() {
	local label="$1"
	shift
	if [ "$#" -eq 0 ]; then
		return
	fi
	issues=1
	echo ""
	echo "  $label:"
	for item in "$@"; do
		printf "    %s\n" "$item"
	done
}

collect() {
	local label="$1"
	shift
	local found=()
	for app in ./*; do
		if [ -f "$app/pubspec.yaml" ]; then
			local name
			name=$(basename "$app")
			"$@" "$app" "$name" && found+=("$name")
		fi
	done
	report "$label" "${found[@]}"
}

check_sdk() {
	local app="$1" name="$2"
	! grep -qF "$STD_SDK" "$app/pubspec.yaml"
}

check_lints() {
	local app="$1" name="$2"
	[ ! -f "$app/analysis_options.yaml" ] || ! grep -q "flutter_lints" "$app/pubspec.yaml"
}

check_name() {
	local app="$1" name="$2"
	[ "$(grep -m1 '^name:' "$app/pubspec.yaml" | awk '{print $2}')" != "$name" ]
}

check_android_id() {
	local app="$1" name="$2"
	local f="$app/android/app/build.gradle.kts"
	[ ! -f "$f" ] && return 1
	! grep -q 'namespace = "github\.nisrulz\.' "$f"
}

check_gradle() {
	local app="$1" name="$2"
	local props="$app/android/gradle/wrapper/gradle-wrapper.properties"
	[ ! -f "$props" ] && return 1
	! grep -q "$GRADLE_MODE" "$props"
}

check_docs() {
	local app="$1" name="$2"
	! grep -q "(/$name)" documentation/EXAMPLES.md
}

separator
echo "  Repository doctor:"
echo "  Checking all apps for configuration drift."

collect "Apps with a non-standard SDK constraint" check_sdk
collect "Apps missing analysis_options.yaml or flutter_lints" check_lints
collect "Apps whose pubspec name does not match the folder" check_name
collect "Apps not using the github.nisrulz.* Android applicationId" check_android_id
collect "Apps not on the standard Gradle version" check_gradle
collect "Apps missing from documentation/EXAMPLES.md (run 'make docs')" check_docs

# Tracked generated files that should not be in git.
tracked_generated=$(git ls-files | grep -E "\.dart_tool/|GeneratedPluginRegistrant|\.flutter-plugins-dependencies|pubspec\.lock" || true)
if [ -n "$tracked_generated" ]; then
	issues=1
	echo ""
	echo "  Tracked generated files (remove with 'git rm --cached'):"
	echo "$tracked_generated" | sed 's/^/    /'
fi

separator
if [ "$issues" -eq 0 ]; then
	echo "  All checks passed."
else
	echo "  Issues found. Fix them before committing."
	exit 1
fi
separator