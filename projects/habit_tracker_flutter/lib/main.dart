import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/data_store.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/home_page.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  final dataStore = HiveDataStore();
  await dataStore.init();
  // Store some demo tasks
  await dataStore.createDemoTasks(
    frontTasks: [
      Task.create(iconName: AppAssets.carrot, name: 'Vegan'),
      Task.create(iconName: AppAssets.chef, name: 'Cook your meal'),
      Task.create(iconName: AppAssets.dog, name: 'Walk the dog'),
      Task.create(iconName: AppAssets.html, name: 'Do some coding'),
      Task.create(iconName: AppAssets.karate, name: 'Karate'),
    ],
    force: false,
  );
  runApp(ProviderScope(
    overrides: [
      dataStoreProvider.overrideWithValue(dataStore),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
      ),
      home: AppTheme(
        data: AppThemeData.defaultWithSwatch(AppColors.red),
        child: HomePage(),
      ),
    );
  }
}
