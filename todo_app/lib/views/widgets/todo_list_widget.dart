import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/all_providers.dart';

class TodoList extends ConsumerWidget {
  TodoModel item;
  TodoList({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(todoListProvider.notifier).toggle(item.id);
        },
      ),
      title: Text(item.description),
    );
  }
}
