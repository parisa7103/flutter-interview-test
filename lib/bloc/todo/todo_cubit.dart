import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_test/bloc/todo/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<String> todos = [];

  TodoCubit() : super(InitState());

  void addTodo(String todoText) {
    todos.add(todoText);
    emit(ListModifiedState());
  }
}
