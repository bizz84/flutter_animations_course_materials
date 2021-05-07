import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final dataStore = ref.watch(dataStoreProvider);
      return ValueListenableBuilder(
        valueListenable: dataStore.frontTasksListenable(),
        builder: (_, Box<Task> box, __) => TasksGridPage(
          tasks: box.values.toList(),
        ),
      );
    });
  }
}
