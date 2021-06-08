import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const tasksBoxName = 'tasks';
  static const tasksStateBoxName = 'tasksState';
  static String taskStateKey(String key) => 'tasksState/$key';

  Future<void> init() async {
    await Hive.initFlutter();
    // register adapters
    Hive.registerAdapter<Task>(TaskAdapter());
    Hive.registerAdapter<TaskState>(TaskStateAdapter());
    // open boxes
    await Hive.openBox<Task>(tasksBoxName);
    await Hive.openBox<TaskState>(tasksStateBoxName);
  }

  Future<void> createDemoTasks({
    required List<Task> tasks,
    bool force = false,
  }) async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isEmpty || force) {
      await box.clear();
      await box.addAll(tasks);
    } else {
      print('Box already has ${box.length} items');
    }
  }

  ValueListenable<Box<Task>> tasksListenable() {
    return Hive.box<Task>(tasksBoxName).listenable();
  }

  Future<void> setTaskState({
    required Task task,
    required bool completed,
  }) async {
    final box = Hive.box<TaskState>(tasksStateBoxName);
    final taskState = TaskState(taskId: task.id, completed: completed);
    await box.put(taskStateKey(task.id), taskState);
  }

  ValueListenable<Box<TaskState>> taskStateListenable({required Task task}) {
    final box = Hive.box<TaskState>(tasksStateBoxName);
    final key = taskStateKey(task.id);
    return box.listenable(keys: <String>[key]);
  }

  TaskState taskState(Box<TaskState> box, {required Task task}) {
    final key = taskStateKey(task.id);
    return box.get(key) ?? TaskState(taskId: task.id, completed: false);
  }
}

final dataStoreProvider = Provider<HiveDataStore>((ref) {
  throw UnimplementedError();
});
