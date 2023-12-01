import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

enum SlideDirection {
  leftToRight,
  rightToLeft,
}

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({super.key, this.child, required this.direction});
  final Widget? child;
  final SlideDirection direction;

  static const paddingWidth = 9.0;
  static const leftPanelFixedWidth = 54.0;

  EdgeInsets get padding => direction == SlideDirection.rightToLeft
      ? const EdgeInsets.only(left: 3, right: 6)
      : const EdgeInsets.only(left: 6, right: 3);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: AppTheme.of(context).accent,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: child,
      ),
    );
  }
}
