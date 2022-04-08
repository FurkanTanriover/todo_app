import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //yapılmamış olan görevlerimizin sayısını tuttuğumuz değişken
    int onCompletedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length;

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
          child: TextButton(onPressed: () {}, child: const Text("All")),
          message: "All todos",
        ),
        Tooltip(
          child: TextButton(onPressed: () {}, child: const Text("Active")),
          message: "Uncompleted",
        ),
        Tooltip(
          child: TextButton(onPressed: () {}, child: const Text("Completed")),
          message: "Completed",
        )
      ],
    );
  }
}
