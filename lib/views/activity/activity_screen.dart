import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/activity.dart';
import '../../providers/activity_provider.dart';

/// The homepage of our application
class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity"),
      ),
      body: Center(
        child: switch (activity) {
          AsyncData(:final value) => Text('Activity: ${value.activity}'),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
