import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:habit_tracker_flutter/ui/sliding_panel/sliding_panel_animator.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme_manager.dart';
import 'package:hive/hive.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageFlipKey = GlobalKey<PageFlipBuilderState>();
  final _frontSlidingPanelLeftAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _frontSlidingPanelRightAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _frontGridKey = GlobalKey<TasksGridState>();
  final _backSlidingPanelLeftAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _backSlidingPanelRightAnimatorKey =
      GlobalKey<SlidingPanelAnimatorState>();
  final _backGridKey = GlobalKey<TasksGridState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final dataStore = ref.watch(dataStoreProvider);
      return Container(
        color: Colors.black,
        child: PageFlipBuilder(
          key: _pageFlipKey,
          frontBuilder: (_) => ValueListenableBuilder(
            valueListenable: dataStore.frontTasksListenable(),
            builder: (_, Box<Task> box, __) => TasksGridPage(
              key: ValueKey(1),
              leftAnimatorKey: _frontSlidingPanelLeftAnimatorKey,
              rightAnimatorKey: _frontSlidingPanelRightAnimatorKey,
              gridKey: _frontGridKey,
              tasks: box.values.toList(),
              onFlip: () => _pageFlipKey.currentState?.flip(),
              themeSettings: ref.watch(frontThemeManagerProvider),
              onColorIndexSelected: (colorIndex) => ref
                  .read(frontThemeManagerProvider.notifier)
                  .updateColorIndex(colorIndex),
              onVariantIndexSelected: (variantIndex) => ref
                  .read(frontThemeManagerProvider.notifier)
                  .updateVariantIndex(variantIndex),
            ),
          ),
          backBuilder: (_) => ValueListenableBuilder(
            valueListenable: dataStore.backTasksListenable(),
            builder: (_, Box<Task> box, __) => TasksGridPage(
              key: ValueKey(2),
              leftAnimatorKey: _backSlidingPanelLeftAnimatorKey,
              rightAnimatorKey: _backSlidingPanelRightAnimatorKey,
              gridKey: _backGridKey,
              tasks: box.values.toList(),
              onFlip: () => _pageFlipKey.currentState?.flip(),
              themeSettings: ref.watch(backThemeManagerProvider),
              onColorIndexSelected: (colorIndex) => ref
                  .read(backThemeManagerProvider.notifier)
                  .updateColorIndex(colorIndex),
              onVariantIndexSelected: (variantIndex) => ref
                  .read(backThemeManagerProvider.notifier)
                  .updateVariantIndex(variantIndex),
            ),
          ),
        ),
      );
    });
  }
}
