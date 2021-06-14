import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/page_flip_builder.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final _pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataStore = ref.watch(dataStoreProvider);
    return PageFlipBuilder(
      key: _pageFlipKey,
      frontBuilder: (_) => ValueListenableBuilder(
        valueListenable: dataStore.frontTasksListenable(),
        builder: (_, Box<Task> box, __) => TasksGridPage(
          tasks: box.values.toList(),
          onFlip: () => _pageFlipKey.currentState?.flip(),
        ),
      ),
      backBuilder: (_) => ValueListenableBuilder(
        valueListenable: dataStore.backTasksListenable(),
        builder: (_, Box<Task> box, __) => TasksGridPage(
          tasks: box.values.toList(),
          onFlip: () => _pageFlipKey.currentState?.flip(),
        ),
      ),
    );
  }
}
