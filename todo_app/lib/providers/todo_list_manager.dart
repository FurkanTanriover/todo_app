// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:riverpod/riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager(List<TodoModel> state) : super(state);

  void addTodo(String description) {
    var eklenecekTodo =
        TodoModel(id: const Uuid().v4(), description: description);
    state = [
      ...state,
      eklenecekTodo,
    ]; //var olan liste elemanlarını buna koy sonra eklenecek todoyu lsite sonuna ekle
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            description: todo.description,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [];
    for (var todo in state)
      if (todo.id == id)
        TodoModel(
          id: todo.id,
          description: newDescription,
          completed: todo.completed,
        );
  }

  void remove(TodoModel silinecekTodo) {
    state = state.where((element) => element.id != silinecekTodo.id).toList();
  }


  //listede tamamlanmamış olan görevlerin sayısını döndürüyorum
 
}
