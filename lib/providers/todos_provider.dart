import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo/models/todo.dart';

// Necessary for code-generation to work
part 'todos_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  final List<Todo> _todos = [
    Todo(id: "1", title: 'Learn Flutter', date: DateTime.now(), isDone: true),
    Todo(id: "2", title: 'Learn Riverpod', date: DateTime.now()),
  ];

  @override
  Future<List<Todo>> build() async {
    // Simulate a network request. This would normally come from a real API
    print("BUILD");
    await Future.delayed(const Duration(seconds: 1));
    return _todos;
  }

  Future<void> addTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    _todos.add(todo);

    ref.invalidateSelf();
    await future;
  }
}
