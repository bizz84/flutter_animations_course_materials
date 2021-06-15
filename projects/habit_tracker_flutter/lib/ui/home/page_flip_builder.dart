import 'dart:math';

import 'package:flutter/material.dart';

class PageFlipBuilder extends StatefulWidget {
  const PageFlipBuilder({
    super.key,
    required this.frontBuilder,
    required this.backBuilder,
  });
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  bool _showFrontSide = true;

  @override
  void initState() {
    _controller.addStatusListener(_updateStatus);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => _showFrontSide = !_showFrontSide);
    }
  }

  void flip() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPageFlipBuilder(
      animation: _controller,
      showFrontSide: _showFrontSide,
      frontBuilder: widget.frontBuilder,
      backBuilder: widget.backBuilder,
    );
  }
}

class AnimatedPageFlipBuilder extends AnimatedWidget {
  const AnimatedPageFlipBuilder({
    super.key,
    required Animation<double> animation,
    required this.showFrontSide,
    required this.frontBuilder,
    required this.backBuilder,
  }) : super(listenable: animation);
  final bool showFrontSide;
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    // animation values [0, 1] -> rotation values [0, pi]
    // show the front side for animation values between 0.0 and 0.5
    // show the back side for animation values between 0.5 and 1.0
    // this boolean tells us if we're on the first or second half of the animation
    final isAnimationFirstHalf = animation.value < 0.5;
    // decide which page we need to show
    final child =
        isAnimationFirstHalf ? frontBuilder(context) : backBuilder(context);
    // map values between [0, 1] to values between [0, pi]
    final rotationValue = animation.value * pi;
    // calculate the correct rotation angle depening on which side we need to show
    final rotationAngle =
        animation.value > 0.5 ? pi - rotationValue : rotationValue;
    // calculate tilt
    var tilt = (animation.value - 0.5).abs() - 0.5;
    // make this a small value (positive or negative as needed)
    tilt *= isAnimationFirstHalf ? -0.003 : 0.003;
    return Transform(
      transform: Matrix4.rotationY(rotationAngle)..setEntry(3, 0, tilt),
      alignment: Alignment.center,
      child: child,
    );
  }
}
