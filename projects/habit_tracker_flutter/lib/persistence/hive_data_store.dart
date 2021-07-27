import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/app_theme_settings.dart';
import 'package:habit_tracker_flutter/models/front_or_back_side.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const frontTasksBoxName = 'frontTasks';
  static const backTasksBoxName = 'backTasks';
  static const tasksStateBoxName = 'tasksState';
  static const flagsBoxName = 'flags';
  static String taskStateKey(String key) => 'tasksState/$key';
  static const frontAppThemeBoxName = 'frontAppTheme';
  static const backAppThemeBoxName = 'backAppTheme';

  static const alwaysShowAddTaskKey = 'alwaysShowAddTask';
  static const didAddFirstTaskKey = 'didAddFirstTask';

  Future<void> init() async {
    await Hive.initFlutter();
    // register adapters
    Hive.registerAdapter<Task>(TaskAdapter());
    Hive.registerAdapter<TaskState>(TaskStateAdapter());
    Hive.registerAdapter<AppThemeSettings>(AppThemeSettingsAdapter());
    // open boxes
    // task lists
    await Hive.openBox<Task>(frontTasksBoxName);
    await Hive.openBox<Task>(backTasksBoxName);
    // task states
    await Hive.openBox<TaskState>(tasksStateBoxName);
    // theming
    await Hive.openBox<AppThemeSettings>(frontAppThemeBoxName);
    await Hive.openBox<AppThemeSettings>(backAppThemeBoxName);
    // flags
    await Hive.openBox<bool>(flagsBoxName);
  }

  Future<void> createDemoTasks({
    required List<Task> frontTasks,
    required List<Task> backTasks,
    bool force = false,
  }) async {
    final frontBox = Hive.box<Task>(frontTasksBoxName);
    if (frontBox.isEmpty || force == true) {
      await frontBox.clear();
      await frontBox.addAll(frontTasks);
    } else {
      print('Box already has ${frontBox.length} items');
    }
    final backBox = Hive.box<Task>(backTasksBoxName);
    if (backBox.isEmpty || force == true) {
      await backBox.clear();
      await backBox.addAll(backTasks);
    } else {
      print('Box already has ${backBox.length} items');
    }
  }

  // front and back tasks
  ValueListenable<Box<Task>> frontTasksListenable() {
    return Hive.box<Task>(frontTasksBoxName).listenable();
  }

  ValueListenable<Box<Task>> backTasksListenable() {
    return Hive.box<Task>(backTasksBoxName).listenable();
  }

  // TaskState methods
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

  // App Theme Settings
  Future<void> setAppThemeSettings(
      {required AppThemeSettings settings,
      required FrontOrBackSide side}) async {
    final themeKey = side == FrontOrBackSide.front
        ? frontAppThemeBoxName
        : backAppThemeBoxName;
    final box = Hive.box<AppThemeSettings>(themeKey);
    await box.put(themeKey, settings);
  }

  Future<AppThemeSettings> appThemeSettings(
      {required FrontOrBackSide side}) async {
    final themeKey = side == FrontOrBackSide.front
        ? frontAppThemeBoxName
        : backAppThemeBoxName;
    final box = Hive.box<AppThemeSettings>(themeKey);
    final settings = box.get(themeKey);
    return settings ?? AppThemeSettings.defaults(side);
  }

  // Save and delete tasks
  Future<void> saveTask(Task task, FrontOrBackSide frontOrBackSide) async {
    final boxName = frontOrBackSide == FrontOrBackSide.front
        ? frontTasksBoxName
        : backTasksBoxName;
    final box = Hive.box<Task>(boxName);
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

  Future<void> deleteTask(Task task, FrontOrBackSide frontOrBackSide) async {
    final boxName = frontOrBackSide == FrontOrBackSide.front
        ? frontTasksBoxName
        : backTasksBoxName;
    final box = Hive.box<Task>(boxName);
    if (box.isNotEmpty) {
      final index = box.values
          .toList()
          .indexWhere((taskAtIndex) => taskAtIndex.id == task.id);
      if (index >= 0) {
        await box.deleteAt(index);
      }
    }
  }

  // Did Add First Task
  Future<void> setDidAddFirstTask(bool value) async {
    final box = Hive.box<bool>(flagsBoxName);
    await box.put(didAddFirstTaskKey, value);
  }

  ValueListenable<Box<bool>> didAddFirstTaskListenable() {
    return Hive.box<bool>(flagsBoxName)
        .listenable(keys: <String>[didAddFirstTaskKey]);
  }

  bool didAddFirstTask(Box<bool> box) {
    final value = box.get(didAddFirstTaskKey);
    return value ?? false;
  }

  // Always Show Add Task
  Future<void> setAlwaysShowAddTask(bool value) async {
    final box = Hive.box<bool>(flagsBoxName);
    await box.put(alwaysShowAddTaskKey, value);
  }

  ValueListenable<Box<bool>> alwaysShowAddTaskListenable() {
    return Hive.box<bool>(flagsBoxName)
        .listenable(keys: <String>[alwaysShowAddTaskKey]);
  }

  bool alwaysShowAddTask(Box<bool> box) {
    final value = box.get(alwaysShowAddTaskKey);
    return value ?? true;
  }
}

final dataStoreProvider = Provider<HiveDataStore>((ref) {
  throw UnimplementedError();
});
