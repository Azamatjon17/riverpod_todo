import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/todo.dart';
import '../../providers/todos_provider.dart';

/// The homepage of our application
class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Todo>> todos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        actions: [
          IconButton(
            onPressed: () {
              _showAddTodoDialog(context, ref);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: switch (todos) {
          AsyncData(:final value) => ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final todo = value[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) {
                      // You can implement the logic for toggling the todo's done status here
                    },
                  ),
                );
              },
            ),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController _todoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            controller: _todoController,
            decoration: const InputDecoration(hintText: 'Enter todo title'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newTitle = _todoController.text.trim();
                if (newTitle.isNotEmpty) {
                  ref.read(todoListProvider.notifier).addTodo(Todo(
                      id: DateTime.now().toString(),
                      title: newTitle,
                      date: DateTime.now()));
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
