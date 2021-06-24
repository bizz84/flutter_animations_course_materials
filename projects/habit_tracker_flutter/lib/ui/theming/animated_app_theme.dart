import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class AppThemeDataTween extends Tween<AppThemeData> {
  AppThemeDataTween({AppThemeData? begin, AppThemeData? end})
      : super(begin: begin, end: end);

  @override
  AppThemeData lerp(double t) => AppThemeData.lerp(begin!, end!, t);
}

class AnimatedAppTheme extends ImplicitlyAnimatedWidget {
  const AnimatedAppTheme({
    Key? key,
    required Duration duration,
    required this.data,
    required this.child,
  }) : super(key: key, duration: duration);
  final AppThemeData data;
  final Widget child;

  @override
  _AnimatedAppThemeState createState() => _AnimatedAppThemeState();
}

class _AnimatedAppThemeState extends AnimatedWidgetBaseState<AnimatedAppTheme> {
  AppThemeDataTween? _themeDataTween;

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: _themeDataTween!.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _themeDataTween = visitor(
      _themeDataTween,
      widget.data,
      (dynamic value) => AppThemeDataTween(begin: value as AppThemeData),
    ) as AppThemeDataTween?;
  }
}
