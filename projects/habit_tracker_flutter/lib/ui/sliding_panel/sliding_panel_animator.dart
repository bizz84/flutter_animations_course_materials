import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/animations/animation_controller_state.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/sliding_panel.dart';

class SlidingPanelAnimator extends StatefulWidget {
  const SlidingPanelAnimator({
    super.key,
    required this.direction,
    required this.child,
  });
  final SlideDirection direction;
  final Widget child;

  // ignore_for_file: no_logic_in_create_state
  @override
  SlidingPanelAnimatorState createState() =>
      SlidingPanelAnimatorState(const Duration(milliseconds: 200));
}

class SlidingPanelAnimatorState
    extends AnimationControllerState<SlidingPanelAnimator> {
  SlidingPanelAnimatorState(super.duration);

  late final _curveAnimation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOutCubic,
  ));

  void slideIn() {
    animationController.forward();
  }

  void slideOut() {
    animationController.reverse();
  }

  double _getOffsetX(double screenWidth, double animationValue) {
    final startOffset = widget.direction == SlideDirection.rightToLeft
        ? screenWidth - SlidingPanel.leftPanelFixedWidth
        : -SlidingPanel.leftPanelFixedWidth;
    return startOffset * (1.0 - animationValue);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curveAnimation,
      child: SlidingPanel(
        direction: widget.direction,
        child: widget.child,
      ),
      builder: (context, child) {
        final animationValue = _curveAnimation.value;
        // if not on-screen, return empty container
        if (animationValue == 0.0) {
          return Container();
        }
        // else return the SlidingPanel
        final screenWidth = MediaQuery.of(context).size.width;
        final offsetX = _getOffsetX(screenWidth, animationValue);
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: child,
        );
      },
    );
  }
}
