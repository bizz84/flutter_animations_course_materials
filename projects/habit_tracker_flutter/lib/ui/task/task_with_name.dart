import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/edit_task_button.dart';
import 'package:habit_tracker_flutter/ui/task/animated_task.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TaskWithName extends StatelessWidget {
  const TaskWithName({
    Key? key,
    required this.task,
    this.completed = false,
    this.isEditing = false,
    this.hasCompletedState = true,
    this.onCompleted,
    this.editTaskButtonBuilder,
  }) : super(key: key);
  final Task task;
  final bool completed;
  final bool isEditing;
  final bool hasCompletedState;
  final ValueChanged<bool>? onCompleted;
  final WidgetBuilder? editTaskButtonBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              AnimatedTask(
                iconName: task.iconName,
                completed: completed,
                isEditing: isEditing,
                hasCompletedState: hasCompletedState,
                onCompleted: onCompleted,
              ),
              if (editTaskButtonBuilder != null)
                Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: EditTaskButton.scaleFactor,
                    heightFactor: EditTaskButton.scaleFactor,
                    alignment: Alignment.bottomRight,
                    child: editTaskButtonBuilder!(context),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
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
