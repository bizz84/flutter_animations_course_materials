import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/centered_svg_icon.dart';
import 'package:habit_tracker_flutter/ui/task/task_completion_ring.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TaskRingWithImage extends StatelessWidget {
  const TaskRingWithImage({super.key, required this.iconName});
  final String iconName;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return Stack(
      children: [
        const TaskCompletionRing(progress: 0),
        Positioned.fill(
          child: CenteredSvgIcon(
            iconName: iconName,
            color: themeData.taskIcon,
          ),
        ),
      ],
    );
  }
}
