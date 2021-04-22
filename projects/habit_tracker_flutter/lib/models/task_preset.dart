import 'package:habit_tracker_flutter/constants/app_assets.dart';

class TaskPreset {
  const TaskPreset({required this.name, required this.iconName});
  final String name;
  final String iconName;

  @override
  String toString() => 'TaskPreset($name, $iconName)';

  static const List<TaskPreset> allPresets = [
    TaskPreset(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
    TaskPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
    TaskPreset(name: 'Do Some Coding', iconName: AppAssets.html),
    TaskPreset(name: 'Meditate', iconName: AppAssets.meditation),
    TaskPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
    TaskPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
    TaskPreset(name: 'Take Vitamins', iconName: AppAssets.vitamins),
    TaskPreset(name: 'Cycle to Work', iconName: AppAssets.bike),
    TaskPreset(name: 'Wash Your Hands', iconName: AppAssets.washHands),
    TaskPreset(name: 'Wear a Mask', iconName: AppAssets.mask),
    TaskPreset(name: 'Brush Your Teeth', iconName: AppAssets.toothbrush),
    TaskPreset(name: 'Floss Your Teeth', iconName: AppAssets.dentalFloss),
    TaskPreset(name: 'Drink Water', iconName: AppAssets.water),
    TaskPreset(name: 'Practice Instrument', iconName: AppAssets.guitar),
    TaskPreset(name: 'Read for 10 Minutes', iconName: AppAssets.book),
    TaskPreset(name: 'Don\'t Smoke', iconName: AppAssets.smoking),
    TaskPreset(name: 'Don\'t Drink Alcohol', iconName: AppAssets.beer),
    TaskPreset(name: 'Decrease Screen Time', iconName: AppAssets.phone),
    TaskPreset(name: 'Do a Workout', iconName: AppAssets.dumbell),
    TaskPreset(name: 'Do Karate', iconName: AppAssets.karate),
    TaskPreset(name: 'Go Running', iconName: AppAssets.run),
    TaskPreset(name: 'Go Swimming', iconName: AppAssets.swimmer),
    TaskPreset(name: 'Do Some Stretches', iconName: AppAssets.stretching),
    TaskPreset(name: 'Play Sports', iconName: AppAssets.basketball),
    TaskPreset(name: 'Spend Time Outside', iconName: AppAssets.sun),
  ];
}
