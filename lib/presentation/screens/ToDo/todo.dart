import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/bloc/todo/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_test/bloc/todo/todo_state.dart';
import 'package:flutter_interview_test/presentation/dialogs/todo/add_todo_dialog.dart';
import 'package:flutter_interview_test/presentation/utils/color.dart';
import 'package:flutter_interview_test/presentation/widgets/todo/todo_item.dart';

class Todo extends StatefulWidget {
  Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late TodoCubit todoCubit;

  @override
  Widget build(BuildContext context) {
    todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novaday's interview test"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showTodoDialog(context),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          List<Widget> widgetList = [];
          for (int index = 0; index < todoCubit.todos.length; index++) {
            widgetList.add(Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(todoCubit.todos[index]),
              onDismissed: (direction) {
                setState(() {
                  todoCubit.todos.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${todoCubit.todos[index]} dismissed")));
              },
              background: Container(
                  color: primaryColor[100],
                  child: Center(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.redAccent, fontSize: 18),
                    ),
                  )),
              child: TodoItem(title: todoCubit.todos[index],index: index,todoCubit: todoCubit
                ,),
            ));
          }
          if (state is ListModifiedState) {
            return ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final String item = todoCubit.todos.removeAt(oldIndex);
                  todoCubit.todos.insert(newIndex, item);
                });
              },
              children: widgetList,
            );
          }
          return const Center(child: Text("Oops! nothing to show :("));
        },
      ),
    );
  }

  void showTodoDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled:true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: primaryDarkColor,
      builder: (context) => AddTodoDialog(),
    ).then((todoText) {
      print("TODO: ${todoText.toString()}");
      if (todoText.toString().isNotEmpty) {
        todoCubit.addTodo(todoText);
      }
    });
  }
}
