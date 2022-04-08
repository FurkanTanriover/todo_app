import 'package:riverpod/riverpod.dart';
import 'package:todo_app/providers/todo_list_manager.dart';

import '../models/todo_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([]);
});