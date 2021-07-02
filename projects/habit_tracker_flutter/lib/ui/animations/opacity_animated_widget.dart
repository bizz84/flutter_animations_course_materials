import 'package:flutter/material.dart';

class OpacityAnimatedWidget extends AnimatedWidget {
  OpacityAnimatedWidget({
    super.key,
    required Animation<double> animation,
    required this.child,
  })  : opacityAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          ),
        ),
        super(listenable: animation);
  final Animation<double> opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityAnimation.value,
      child: child,
    );
  }
}
