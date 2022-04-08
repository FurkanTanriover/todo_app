import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/all_providers.dart';
import 'package:todo_app/views/widgets/title_widget.dart';
import 'package:todo_app/views/widgets/todo_list_widget.dart';
import 'package:todo_app/views/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoAppScreen extends ConsumerWidget {
  TodoAppScreen({Key? key}) : super(key: key);

  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            autofocus: false,
            decoration:
                const InputDecoration(labelText: "Bugün neler yapacaksın??"),
            onSubmitted: (newTodo) {
              debugPrint("şunu ekle $newTodo");
              ref
                  .read(todoListProvider.notifier)
                  .addTodo(newTodoController.text);
            },
          ),
          const SizedBox(height: 20),
          const ToolBarWidget(),
          for (int i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(allTodos[i].id),
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(allTodos[i]);
                },
                child: TodoList(item: allTodos[i])),
        ],
      ),
    );
  }
}
