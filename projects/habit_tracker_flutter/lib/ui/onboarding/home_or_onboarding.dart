import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/home_page.dart';
import 'package:habit_tracker_flutter/ui/onboarding/onboarding_page.dart';

class HomeOrOnboarding extends ConsumerWidget {
  const HomeOrOnboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataStore = ref.watch(dataStoreProvider);
    return ValueListenableBuilder(
      valueListenable: dataStore.didAddFirstTaskListenable(),
      builder: (_, Box<bool> box, __) {
        return dataStore.didAddFirstTask(box)
            ? const HomePage()
            : const OnboardingPage();
      },
    );
  }
}
