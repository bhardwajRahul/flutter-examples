# Contributing

I welcome and encourage all pull requests. It usually takes 24-48 hours to respond to any issue or request.

## Example app structure

Every example app uses the same structure, so the code that teaches a concept is
easy to find:

- `lib/main.dart`: the app wrapper. It holds only `runApp()` and a `MyApp` widget
  that returns the `MaterialApp` (title, theme, routes). Keep this file minimal and
  uniform across apps.
- `lib/example.dart`: the focused example code. It contains the full screen
  (`Scaffold` + `AppBar`) and the widget that demonstrates the concept, with a
  `// Example: <what this app teaches>` comment at the top.
- Supporting files (screens, tabs, services, models, widgets, utils) sit alongside
  the example and are imported by `lib/example.dart`.

To understand an example app, read `lib/example.dart`. That file holds the concept;
`lib/main.dart` holds only the wrapping boilerplate.

## Basic rules

1. Match coding style (braces, spacing, etc.). Use the `Reformat Code` feature of Android Studio (`CMD` + `Option` + `L` on Mac, `CTRL` + `ALT` + `L` on Linux and Windows).
1. For a feature or bugfix, only change the code that is needed for it.
1. Keep pull request titles easy to read and descriptive. This makes them easier to merge.
1. Pull requests must be made against the `develop` branch. Requests against any other branch will be rejected. [Here is a link to a good PR made to this repo.](https://github.com/nisrulz/flutter-examples/pull/130)
1. Check for existing [issues](https://github.com/nisrulz/flutter-examples/issues) before filing a new one.
1. Follow the same standard as all other projects in this repo.
   > The package name must conform to the format: `github.nisrulz.<app_name>`

When you add a new example app, keep the wrapper in `lib/main.dart` and the focused
example code in `lib/example.dart`. Run `make docs`, `make analyze`, and `make doctor`
before opening a pull request.
