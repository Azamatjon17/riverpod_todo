import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/activity.dart';

// Necessary for code-generation to work
part 'activity_provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<Activity> activity(ActivityRef ref) async {
  final dio = Dio();
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await dio.get('https://bored-api.appbrewery.com/random');
  // Finally, we convert the Map into an Activity instance.
  return Activity.fromJson(response.data);
}
