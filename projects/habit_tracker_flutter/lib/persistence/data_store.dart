import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';

/// Domain-specific data store interface
abstract class DataStore {
  // For demo purposes only
  Future<void> createDemoTasks({
    required List<Task> frontTasks,
    bool force = false,
  });

  // Get all tasks that have been created (using positional index)
  ValueListenable<Box<Task>> frontTasksListenable();

  // Set the state of a given task
  Future<void> setTaskState({required Task task, required bool completed});
  // Read the state of a given task
  ValueListenable<Box<TaskState>> taskStateListenable({required Task task});
  TaskState taskState(Box<TaskState> box, {required Task task});
}

final dataStoreProvider = Provider<DataStore>((ref) {
  throw UnimplementedError();
});
