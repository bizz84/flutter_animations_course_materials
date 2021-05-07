import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:habit_tracker_flutter/persistence/data_store.dart';
import 'package:habit_tracker_flutter/ui/task/task_with_name.dart';

class TaskWithNameBuilder extends ConsumerWidget {
  const TaskWithNameBuilder({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final dataStore = ref.watch(dataStoreProvider);
    return ValueListenableBuilder(
      valueListenable: dataStore.taskStateListenable(task: task),
      builder: (_, Box<TaskState> box, __) {
        final taskState = dataStore.taskState(box, task: task);
        return TaskWithName(
          task: task,
          completed: taskState.completed,
          onCompleted: () {
            final dataStore = context.read(dataStoreProvider);
            dataStore.setTaskState(task: task, completed: true);
          },
          onDismissed: () {
            final dataStore = context.read(dataStoreProvider);
            dataStore.setTaskState(task: task, completed: false);
          },
        );
      },
    );
  }
}
