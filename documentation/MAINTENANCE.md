# Repository Maintenance

All maintenance commands are available through the `Makefile` at the repository root. Run `make help` to see the full list.

## Available commands

| Command | Description |
| --- | --- |
| `make help` | Show all available commands |
| `make packages` | Run `flutter packages get` for all example apps |
| `make analyze` | Run `flutter analyze` for all example apps |
| `make test` | Run `flutter test` for all example apps that have tests |
| `make doctor` | Check every app for configuration drift |
| `make clean-builds` | Move all build folders to trash |
| `make gradle-update` | Upgrade Gradle wrappers to the latest version |
| `make docs` | Regenerate `documentation/EXAMPLES.md` from the app folders |

## Update Gradle wrappers

`make gradle-update` upgrades the Gradle wrapper of every example app.

## Drift checks

`make doctor` scans every example app and reports configuration drift: non-standard
SDK constraints, missing `analysis_options.yaml` or `flutter_lints`, pubspec names
that do not match their folder, Android `applicationId`s outside the
`github.nisrulz.*` convention, non-standard Gradle versions, apps missing from
`EXAMPLES.md`, and generated files accidentally tracked in git. It exits non-zero
when issues are found, so you can use it as a pre-commit gate.

Run `make analyze` after changing any app to confirm `flutter analyze` is clean.

| Option | Description |
| --- | --- |
| `VERSION=<x.y.z>` | Target a specific Gradle version. Default: latest from GitHub |
| `FORCE=1` | Upgrade even when the app is already on the target version |

Examples:

```bash
make gradle-update                             # latest version
make gradle-update VERSION=9.7.0               # specific version
make gradle-update FORCE=1                     # latest version, force update
make gradle-update VERSION=9.7.0 FORCE=1       # specific version, force update
```

## Firebase apps

These apps connect to Firebase and need a developer-provided `google-services.json`
in `<app>/android/app/` before they can be built:

- `firebase_google_authentication`
- `google_signin`
- `push_notifications`
- `using_firebase_db`

The file is never committed because it contains your Firebase project config.
Create a Firebase project for each app and download the file from the Firebase console.

## Requirements

- `make` (preinstalled on macOS and most Linux systems)
- `trash` (required by `make clean-builds`): `brew install trash`
