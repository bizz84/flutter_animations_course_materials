import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/centered_svg_icon.dart';
import 'package:habit_tracker_flutter/ui/task/task_completion_ring.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask({
    Key? key,
    required this.iconName,
    required this.completed,
    this.onCompleted,
  }) : super(key: key);
  final String iconName;
  final bool completed;
  final ValueChanged<bool>? onCompleted;

  @override
  _AnimatedTaskState createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curveAnimation;
  bool _showCheckIcon = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _animationController.addStatusListener(_checkStatusUpdates);
    _curveAnimation = _animationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_checkStatusUpdates);
    _animationController.dispose();
    super.dispose();
  }

  void _checkStatusUpdates(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onCompleted?.call(true);
      if (mounted) {
        setState(() => _showCheckIcon = true);
      }
      Future.delayed(Duration(seconds: 1), () {
        if (mounted) {
          setState(() => _showCheckIcon = false);
        }
      });
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.completed &&
        _animationController.status != AnimationStatus.completed) {
      _animationController.forward();
    } else if (!_showCheckIcon) {
      widget.onCompleted?.call(false);
      _animationController.value = 0.0;
    }
  }

  void _handleTapCancel() {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: (_) => _handleTapCancel(),
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _curveAnimation,
        builder: (BuildContext context, Widget? child) {
          final themeData = AppTheme.of(context);
          final progress = widget.completed ? 1.0 : _curveAnimation.value;
          final hasCompleted = progress == 1.0;
          final iconColor =
              hasCompleted ? themeData.accentNegative : themeData.taskIcon;
          return Stack(
            children: [
              TaskCompletionRing(
                progress: progress,
              ),
              Positioned.fill(
                child: CenteredSvgIcon(
                  iconName: hasCompleted && _showCheckIcon
                      ? AppAssets.check
                      : widget.iconName,
                  color: iconColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
