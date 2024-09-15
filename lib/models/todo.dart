import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

/// The response of the `GET /api/todo` endpoint.
///
/// It is defined using `freezed` and `json_serializable`.
@freezed
class Todo with _$Todo {
  factory Todo({
    required String id,
    required String title,
    required DateTime date,
    @Default(false) bool isDone,
  }) = _Todo;

  /// Convert a JSON object into an [Todo] instance.
  /// This enables type-safe reading of the API response.
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
