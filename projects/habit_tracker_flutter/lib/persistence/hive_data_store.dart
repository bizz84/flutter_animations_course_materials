import 'package:habit_tracker_flutter/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const tasksBoxName = 'tasks';

  Future<void> init() async {
    await Hive.initFlutter();
    // register adapters
    Hive.registerAdapter<Task>(TaskAdapter());
    // open boxes
    await Hive.openBox<Task>(tasksBoxName);
  }

  Future<void> createDemoTasks({
    required List<Task> tasks,
  }) async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isEmpty) {
      await box.addAll(tasks);
    }
  }
}
