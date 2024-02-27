import 'package:flutter/material.dart';

/// All the text styles used in the app
class TextStyles {
  // Used when showing the task name in the main grid
  static const taskName = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 0.0,
    height: 1.2,
  );

  // Large text (for add/edit task pages)
  static const heading = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.2,
  );

  // Regular text (for add/edit task pages)
  static const content = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    height: 1.2,
  );

  // Small text (for add/edit task pages)
  static const caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.2,
  );
}
