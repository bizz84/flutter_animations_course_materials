# Flutter Animations Course | Code With Andrea

This repo contains all the projects from my [Flutter Animations Course](https://nnbd.me/fa).

![Animations course banner](media/flutter-animations-course-banner.png)

The main project for this course is a Flutter habit tracking app, a (simplified) clone of the [Streaks App](https://streaksapp.com/).

## Projects structure

The entire course includes four [projects](projects/):

- **Colors / Numbers Game with Implicit Animations**: This is [located here](projects/colors_numbers_game_flutter) and covered in section 1
- **Flutter Intro Playground**: This is [located here](projects/intro_flutter_playground) and covered in section 1
- **Flutter Stopwatch App**: This is [located here](projects/stopwatch_flutter) and covered in section 2
- **Flutter Habit Tracking App**: This is [located here](projects/habit_tracker_flutter) and covered in sections 3 to 10 (rest of the course)

*Note: each commit in this project corresponds to a specific lesson in the course.*

## Course Syllabus

### 1. Introduction and Implicit Animations

1. Course Outline and Resources 
2. [Article] Join "Code With Andrea" on Slack + Course Q/A
3. [Article] Flutter Installation and IDE Setup
4. Introduction to Animations
5. Download the animations playground project
6. Implicit animations with AnimatedContainer
7. [Exercise] `AnimatedOpacity`
8. Animation Curves
9.  Intro to `TweenAnimationBuilder`
10. Animating HSV colors with `TweenAnimationBuilder`
11. Wrap up on Implicit Animations

### 2. UI Challenge: Stopwatch app

1. Module Introduction
2. Starter project for the Stopwatch app
3. Dark Mode and Custom System UI Overlay
4. Creating a periodic Timer
5. `Ticker` and `TickerProvider`
6. Creating a separate `StopwatchRenderer` widget
7. Sizing the Stopwatch UI with `AspectRatio`
8. Matrix transforms
9. Getting the circle radius from `LayoutBuilder`
10. Implementing the animated clock-hand
11. Completing the stopwatch UI (part 1)
12. Completing the stopwatch UI (part 2)
13. Adding the start/stop/reset functionality (part 1)
14. Adding the start/stop/reset functionality (part 2)
15. Performance and testing considerations when working with tickers!

### 3. Habit Tracker App Overview

1. Habit Tracker App: Introduction
2. Download the Starter Project
3. Linting rules
4. Code walkthrough: Project Assets
5. Code walkthrough: Colors and Theming

### 4. Explicit Animations

1. Module intro & starter project
2. Task completion ring: Technical planning
3. Introduction to `CustomPainter`
4. Drawing a task completion ring with the canvas
5. Introduction to explicit animations with `AnimationController`
6. Animated task completion ring with `AnimationController` and `AnimatedBuilder`
7. Controlling the animation with `GestureDetector`
8. Adding a centered SVG icon to the animated task
9. Task completion UI tweaks
10. Task completion state and final tweaks
11. Bugfix: Handling tap cancel gestures
12. Adding a Task Name
13. Arranging multiple tasks inside a `GridView`
14. Finished project and Wrap Up

### 5. Local Data Persistence with Hive

1. Module intro
2. Technical planning: local vs remote storage
3. Starter project overview
4. Introduction to Hive
5. Creating model classes with Hive
6. Creating a type adapter with code generation
7. Creating the `HiveDataStore`
8. Creating the demo tasks inside `main()`
9. Creating unique Task IDs with the `uuid` package
10. Reading tasks with `ValueListenableBuilder`
11. Wrap up

### 6. State Management with Riverpod

1. Module Intro & Starter Project
2. Introduction to Riverpod
3. Creating and using a data store with `Provider` and `Consumer`
4. Dependency overrides with `ProviderScope`
5. `TaskState` data modelling
6. Creating and using a `TaskState` Hive model class
7. Adding an `onCompleted` callback to the `AnimatedTask` widget
8. Creating a `TaskWithNameLoader`
9. Wrap Up + Using the Widget Inspector

### 7. Page Flip Animation

1. Module Intro: Page Flip Transition
2. Starter project and walkthrough
3. Designing the Page Flip widget API with WidgetBuilders
4. Using a `GlobalKey` to modify the state of a child widget
5. `AnimationController` setup
6. `AnimatedBuilder` vs `AnimatedWidget`
7. Rotation code with `Transform` and `Matrix4`
8. Interactive page flip transition
9. Widgets, elements and keys
10. Extra Challenge: Card flip game

## 8. Advanced Theming

1. Module Intro: Advanced Theming
2. Starter project and walkthrough
3. Showing the bottom panels
4. Creating a SlidingPanelAnimator
5. Using the SlidingPanelAnimator
6. Animating the sliding panels
7. Managing app theme state changes: an overview
8. Implementing the AppThemeManager class with StateNotifier
9. Creating and using the AppThemeManager providers
10. Applying the AppThemeSettings
11. Advanced animated theming with ImplicitlyAnimatedWidget

## 9. More Explicit Animations

1. Module Intro
2. Starter Project & Walkthrough
3. Controlling animations on the TasksGrid widget
4. Adding an AnimatedWidget subclass to scale widgets
5. Staggered animations
6. Adding an AddTaskItem widget
7. Fade in/out animation with an Opacity widget
8. Explicit animations with FadeTransition and ScaleTransition
9. Overview: built-in transition vs implicitly animated widgets in Flutter
10. Bugfix: disabling task completion in edit mode

## 10. Add and Edit Tasks

1. Module Intro: Add and Edit Tasks
2. Navigating to the Add Task and Edit Task pages
3. Overview: AddTaskPage with slivers
4. Overview: TaskDetailsPage and SelectIconPage
5. Overview: Onboarding
6. Conclusion and Next Steps

## Additional Resources

### Useful resources from the Flutter docs

- [Introduction to animations | Flutter.dev](https://flutter.dev/docs/development/ui/animations)
  - [Animations overview](https://flutter.dev/docs/development/ui/animations/overview)
  - [Animations tutorial](https://flutter.dev/docs/development/ui/animations/tutorial)
  - [Implicit animations](https://flutter.dev/docs/development/ui/animations/implicit-animations)
  - [Hero animations](https://flutter.dev/docs/development/ui/animations/hero-animations)
  - [Staggered animations](https://flutter.dev/docs/development/ui/animations/staggered-animations)
- [Implicit animations Codelab | Flutter.dev](https://flutter.dev/docs/codelabs/implicit-animations)
- [Animtions Tutorial | Flutter.dev](https://flutter.dev/docs/development/ui/animations/tutorial)
- [Animation and motion widgets | Flutter.dev](https://flutter.dev/docs/development/ui/widgets/animation)
- [Reduce shader compilation jank on mobile | Flutter.dev](https://flutter.dev/docs/perf/rendering/shader)

### More Flutter animation tutorials from Code With Andrea

- [Learn Flutter Animations in 8 Minutes + Free Gallery App on GitHub](https://codewithandrea.com/videos/learn-flutter-animations/)
- [Flutter Animations: Interactive Page Flip Widget](https://codewithandrea.com/videos/flutter-animations-page-flip-widget-part1/)
- [Flutter Animations: Interactive Page Flip Widget \[Part 2\]](https://codewithandrea.com/videos/flutter-animations-page-flip-widget-part2/)
- [How to reduce AnimationController boilerplate code: Flutter Hooks vs extending the State class](https://codewithandrea.com/videos/reduce-animation-controller-boilerplate-flutter-hooks/)
- [Flutter: Why do TweenAnimationBuilder and AnimatedBuilder have a child argument?](https://codewithandrea.com/articles/flutter-animated-builder-child-widget-argument/)
- [Colors / Numbers Game with Flutter Implicit Animations](https://codewithandrea.com/videos/colors-numbers-game-flutter-implicit-animations/)
- [Flutter Timer vs Ticker: A Case Study](https://codewithandrea.com/articles/flutter-timer-vs-ticker/)
- [Flutter: How to Draw a Task Completion Ring with CustomPainter](https://codewithandrea.com/articles/flutter-drawing-with-custom-painter/)
- [Flutter: Animated Task Completion Ring with AnimationController and AnimatedBuilder](https://codewithandrea.com/articles/flutter-animation-controller-animated-builder/)

### My Flutter Animations Gallery on GitHub

- [Flutter Animations Gallery](https://github.com/bizz84/flutter_animations_gallery)

### My animation packages on pub.dev

- [page_flip_builder](https://pub.dev/packages/page_flip_builder): a custom Flutter widget that enables interactive page-flip transitions in your app.
- [pushable_button](https://pub.dev/packages/pushable_button): a 3D pushable button, ideal for games or important CTAs in the app.

### Popular Flutter animations packages

- [Rive](https://pub.dev/packages/rive): a real-time interactive design and animation tool.
- [SpinKit](https://pub.dev/packages/flutter_spinkit): a collection of animated loading indicators that you can use in your apps.
- [Animations](https://pub.dev/packages/animations): pre-canned animations for commonly-desired effects.
- [Funvas](https://pub.dev/packages/funvas): a growing collection of free examples showing how to create canvas-based animations based on time and math functions.
- [Simple Animations](https://github.com/felixblaschke/simple_animations): a powerful package that makes it easier to implement custom animations for common use cases.
- [Staggered Animations](https://pub.dev/packages/flutter_staggered_animations): easily add staggered animations to your `ListView`, `GridView`, `Column` and `Row` children.
- [Spring](https://pub.dev/packages/spring): a collection of 12 widgets based on spring animation effects.

### Other cool Flutter animations tutorials

- [Marcin Szałek - Flutter: scroll to perfection - Flutter Warsaw #15](https://youtu.be/F6WJAvRWbPo)
  
### Streaks app

The main project of this course is based on this app:

- [Streaks app home page](https://streaksapp.com/)

The complete set of designs for this app can be found here:

- [Streaks | mobbin.design](https://mobbin.design/apps/streaks)

---

### [License: MIT](LICENSE.md)

