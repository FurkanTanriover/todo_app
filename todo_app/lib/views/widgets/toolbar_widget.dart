import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({Key? key}) : super(key: key);
  var _currentfilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filter) {
    return _currentfilter == filter ? Colors.purple : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);
    _currentfilter = ref.watch(todoListFilter);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            onCompletedTodoCount == 0
                ? "Görevler tamamlandı"
                : "Tamamlanmayan  :  " + onCompletedTodoCount.toString(),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal),
            maxLines: 1,
          ),
        ),
        Tooltip(
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: changeTextColor(TodoListFilter.all)),
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.all;
              },
              child: const Text("All")),
          message: "All todos",
        ),
        Tooltip(
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: changeTextColor(TodoListFilter.active)),
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.active;
              },
              child: const Text("Active")),
          message: "Uncompleted",
        ),
        Tooltip(
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: changeTextColor(TodoListFilter.completed)),
              onPressed: () {
                ref.read(todoListFilter.notifier).state =
                    TodoListFilter.completed;
              },
              child: const Text("Completed")),
          message: "Completed",
        )
      ],
    );
  }
}
