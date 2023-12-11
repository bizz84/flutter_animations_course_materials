## December 2023 Update

- Updated source code to Dart 3.2, Flutter 3.16, latest packages
- All starter projects are now available as git checkouts
- Fixed grammar in all the lesson notes
- Updated all projects to `flutter_lints` 3.0.1, disabled some rules to make the course easier to follow:

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # These rules have been disabled for convenience, so you won't encounter
    # them while following the course
    prefer_const_constructors: false
    use_key_in_widget_constructors: false
    avoid_print: false
    use_super_parameters: false
    library_private_types_in_public_api: false
    use_build_context_synchronously: false
    sort_child_properties_last: false
```

### Chapter 1

- Added updated course introduction
- Updated Dartpad examples

### Chapter 2

- Updated starter project (Dart 3.2, Flutter 3.16, latest lint rules)

### Chapter 3

- Updated starter project
- Updated linter rules (makes it easier to follow the course)
- Updated `preloadSVGs()` method to work with `flutter_svg` 2.0 syntax:

```dart
  for (final asset in assets) {
    final loader = SvgAssetLoader(asset);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
```

### Chapter 4

- Updated starter project
- Lesson 8: Using `colorFilter` rather than deprecated `color` when creating a `SvgPicture`:

```dart
SvgPicture.asset(
  iconName,
  // Note: this syntax is needed on flutter_svg 2.0 and above
  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
)
```

### Chapter 5

- Updated starter project to use latest packages (`hive`, `hive_flutter`, `uuid`, `hive_generator`, `build_runner`)
- Lesson 6: added some troubleshooting info for build_runner failure

### Chapter 6

- Updated starter project to use `flutter_riverpod: 2.4.9`
- Updated notes

### Chapter 7

- Updated starter project
- Updated to use `page_flip_builder: 0.1.4`
- Extra challenge: updated source code for the solution

### Chapter 8

- Updated starter project and notes
- Lesson 9: updated `runApp` code to override providers according to the latest syntax:

```dart
runApp(ProviderScope(
  overrides: [
    // Regular providers have a `overrideWithValue method
    dataStoreProvider.overrideWithValue(dataStore),
    // StateNotifierProviders should use overrideWith instead
    frontThemeManagerProvider.overrideWith((ref) => AppThemeManager(
          themeSettings: frontThemeSettings,
          side: FrontOrBackSide.front,
          dataStore: dataStore,
        )),
    backThemeManagerProvider.overrideWith((ref) => AppThemeManager(
          themeSettings: backThemeSettings,
          side: FrontOrBackSide.back,
          dataStore: dataStore,
        )),
  ],
  child: const MyApp(),
));
```

### Chapter 9

- Updated starter project and notes
- Lesson 3: Bug fix for exception thrown during a page flip

### Chapter 10

- Updated starter/finished project to use `modal_bottom_sheet: 3.0.0-pre`
