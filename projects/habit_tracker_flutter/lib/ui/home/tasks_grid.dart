import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/common_widgets/edit_task_button.dart';
import 'package:habit_tracker_flutter/ui/task/task_with_name_loader.dart';

class TasksGrid extends StatefulWidget {
  const TasksGrid({Key? key, required this.tasks, this.onEditTask})
      : super(key: key);
  final List<Task> tasks;
  final VoidCallback? onEditTask;

  @override
  TasksGridState createState() => TasksGridState();
}

class TasksGridState extends State<TasksGrid> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisSpacing = constraints.maxWidth * 0.05;
        final taskWidth = (constraints.maxWidth - crossAxisSpacing) / 2.0;
        const aspectRatio = 0.82;
        final taskHeight = taskWidth / aspectRatio;
        // Use max(x, 0.1) to prevent layout error when keyword is visible in modal page
        final mainAxisSpacing =
            max((constraints.maxHeight - taskHeight * 3) / 2.0, 0.1);
        final tasksLength = widget.tasks.length;
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) {
            final task = widget.tasks[index];
            return TaskWithNameLoader(
              task: task,
              isEditing: false,
              editTaskButtonBuilder: (_) => EditTaskButton(
                onPressed: () => print('Edit Item'),
              ),
            );
          },
          itemCount: tasksLength,
        );
      },
    );
  }
}
