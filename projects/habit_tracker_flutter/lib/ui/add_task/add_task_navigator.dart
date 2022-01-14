import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/front_or_back_side.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_preset.dart';
import 'package:habit_tracker_flutter/ui/add_task/add_task_page.dart';
import 'package:habit_tracker_flutter/ui/add_task/task_details_page.dart';

// * The "add task" flow is composed by these two pages
class AddTaskRoutes {
  static const root = '/';
  static const confirmTask = '/confirmTask';
}

class AddTaskNavigator extends StatelessWidget {
  const AddTaskNavigator({Key? key, required this.frontOrBackSide})
      : super(key: key);
  final FrontOrBackSide frontOrBackSide;

  @override
  Widget build(BuildContext context) {
    // * Using a nested navigator to show the `AddTaskPage` and `TaskDetailsPage`
    // * widgets inside the same navigation stack within `showCupertinoModalBottomSheet`
    return Navigator(
      initialRoute: AddTaskRoutes.root,
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) {
          switch (routeSettings.name) {
            case AddTaskRoutes.root:
              return AddTaskPage();
            case AddTaskRoutes.confirmTask:
              // * The TaskPreset is passed to the route arguments, so here
              // * we extract it and use it to create a new Task object
              final taskPreset = routeSettings.arguments as TaskPreset;
              final task = Task.create(
                name: taskPreset.name,
                iconName: taskPreset.iconName,
              );
              return TaskDetailsPage(
                task: task,
                isNewTask: true,
                frontOrBackSide: frontOrBackSide,
              );
            default:
              throw UnimplementedError();
          }
        },
      ),
    );
  }
}
