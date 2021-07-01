import 'package:flutter/material.dart';

class StaggeredScaleAnimatedWidget extends AnimatedWidget {
  const StaggeredScaleAnimatedWidget({
    super.key,
    required Animation<double> animation,
    required this.child,
  }) : super(listenable: animation);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      alignment: Alignment.center,
      child: child,
    );
  }
}
