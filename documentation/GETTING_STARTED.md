# Getting Started

## Prerequisites

Install Flutter. See the [official setup guide](https://flutter.dev/setup/).

You also need an editor. See the [Flutter docs](https://flutter.dev/docs/get-started/editor) for setup.

## Run an example app

Clone this repository and install packages:

```bash
git clone https://github.com/nisrulz/flutter-examples.git
cd flutter-examples
make packages
```

Open any example folder in your editor, then run the app on a device or emulator:

```bash
cd <example-folder>
flutter run
```

For example:

```bash
cd simple_material_app
flutter run
```

## Where to look for the example code

Every example app is split into two files:

- `lib/main.dart`: the app wrapper. It only sets up the `MaterialApp` (title, theme, routes).
- `lib/example.dart`: the focused example code. This file teaches the concept the
  app demonstrates. Open it to see how the feature works.

## Useful links

- [Flutter Widgets Catalog](https://flutter.dev/widgets/)
- [Learn Dart](https://dart.dev/guides)

## Download a single example

The repository is large. If you only want one example, use git sparse-checkout:

```bash
git clone --no-checkout https://github.com/nisrulz/flutter-examples.git
cd flutter-examples
git sparse-checkout init --cone
git sparse-checkout set <example_folder>
git checkout
```

Example:

```bash
git clone --no-checkout https://github.com/nisrulz/flutter-examples.git
cd flutter-examples
git sparse-checkout init --cone
git sparse-checkout set simple_material_app
git checkout
```

You now have the single example checked out.
