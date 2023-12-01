import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/task/animated_task.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TaskWithName extends StatelessWidget {
  const TaskWithName({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedTask(
            iconName: task.iconName,
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 39,
          child: Text(
            task.name.toUpperCase(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyles.taskName.copyWith(
              color: AppTheme.of(context).accent,
            ),
          ),
        ),
      ],
    );
  }
}
