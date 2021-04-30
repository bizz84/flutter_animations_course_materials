import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/task/task_completion_ring.dart';

class AnimatedTask extends StatefulWidget {
  @override
  _AnimatedTaskState createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TaskCompletionRing(
      progress: 0.6,
    );
  }
}
