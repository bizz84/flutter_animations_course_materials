import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:habit_tracker_flutter/persistence/data_store.dart';

class HiveDataStore implements DataStore {
  // box names
  static const tasksStateBoxName = 'tasksState';
  static const frontTasksBoxName = 'frontTasks';
  // keys
  static String taskStateKey(String taskId) => 'tasksState/$taskId';

  // Initialize everything
  Future<void> init() async {
    await Hive.initFlutter();
    // register adapters
    Hive.registerAdapter<TaskState>(TaskStateAdapter());
    Hive.registerAdapter<Task>(TaskAdapter());
    // open boxes
    // task states
    await Hive.openBox<TaskState>(tasksStateBoxName);
    // task lists
    await Hive.openBox<Task>(frontTasksBoxName);
  }

  @override
  Future<void> createDemoTasks({
    required List<Task> frontTasks,
    bool force = false,
  }) async {
    final frontBox = Hive.box<Task>(frontTasksBoxName);
    if (frontBox.isEmpty || force == true) {
      await frontBox.clear();
      await frontBox.addAll(frontTasks);
    }
  }

  // Task State
  @override
  Future<void> setTaskState(
      {required Task task, required bool completed}) async {
    final box = Hive.box<TaskState>(tasksStateBoxName);
    final key = taskStateKey(task.id);
    final taskState = TaskState(taskId: task.id, completed: completed);
    await box.put(key, taskState);
  }

  @override
  ValueListenable<Box<TaskState>> taskStateListenable({required Task task}) {
    final box = Hive.box<TaskState>(tasksStateBoxName);
    final key = taskStateKey(task.id);
    return box.listenable(keys: <String>[key]);
  }

  @override
  TaskState taskState(Box<TaskState> box, {required Task task}) {
    final key = taskStateKey(task.id);
    return box.get(key) ?? TaskState(taskId: task.id, completed: false);
  }

  // Front and Back tasks
  @override
  ValueListenable<Box<Task>> frontTasksListenable() {
    return Hive.box<Task>(frontTasksBoxName).listenable();
  }

  // Save and delete tasks
  @override
  Future<void> saveTask(Task task) async {
    final box = Hive.box<Task>(frontTasksBoxName);
    if (box.values.isEmpty) {
      await box.add(task);
    } else {
      final index = box.values
          .toList()
          .indexWhere((taskAtIndex) => taskAtIndex.id == task.id);
      if (index >= 0) {
        await box.putAt(index, task);
      } else {
        await box.add(task);
      }
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    final box = Hive.box<Task>(frontTasksBoxName);
    if (box.isNotEmpty) {
      final index = box.values
          .toList()
          .indexWhere((taskAtIndex) => taskAtIndex.id == task.id);
      if (index >= 0) {
        await box.deleteAt(index);
      }
    }
  }
}
