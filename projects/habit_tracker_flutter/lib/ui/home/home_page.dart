import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/sliding_panel_animator.dart';
import 'package:hive/hive.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _pageFlipKey = GlobalKey<PageFlipBuilderState>();
  final _frontSlidingPanelLeftAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _frontSlidingPanelRightAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _backSlidingPanelLeftAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _backSlidingPanelRightAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  @override
  Widget build(BuildContext context) {
    final dataStore = ref.watch(dataStoreProvider);
    return Container(
      color: Colors.black,
      child: PageFlipBuilder(
        key: _pageFlipKey,
        frontBuilder: (_) => ValueListenableBuilder(
          valueListenable: dataStore.frontTasksListenable(),
          builder: (_, Box<Task> box, __) => TasksGridPage(
            key: const ValueKey(1),
            leftAnimatorKey: _frontSlidingPanelLeftAnimatorKey,
            rightAnimatorKey: _frontSlidingPanelRightAnimatorKey,
            tasks: box.values.toList(),
            onFlip: () => _pageFlipKey.currentState?.flip(),
          ),
        ),
        backBuilder: (_) => ValueListenableBuilder(
          valueListenable: dataStore.backTasksListenable(),
          builder: (_, Box<Task> box, __) => TasksGridPage(
            key: const ValueKey(2),
            leftAnimatorKey: _backSlidingPanelLeftAnimatorKey,
            rightAnimatorKey: _backSlidingPanelRightAnimatorKey,
            tasks: box.values.toList(),
            onFlip: () => _pageFlipKey.currentState?.flip(),
          ),
        ),
      ),
    );
  }
}
