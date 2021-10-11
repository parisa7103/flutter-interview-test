import 'package:flutter/material.dart';
import 'package:flutter_interview_test/bloc/todo/todo_cubit.dart';
import 'package:flutter_interview_test/presentation/utils/color.dart';

class TodoItem extends StatefulWidget {
  String title;
  int index;
  TodoCubit todoCubit;

  TodoItem(      {required this.title, required this.index, required TodoCubit this.todoCubit})
      : super();

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  var value = false;
  late bool isEditingEnabled;

  @override
  void initState() {
    isEditingEnabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController =
        TextEditingController(text: widget.title);
    Widget todoItem = Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.grey,
              size: 18,
            ),
            tooltip: "Edit",
            onPressed: () {
              setState(() {
                isEditingEnabled = true;
              });
            })
      ],
    );
    Widget editingTodoItem = Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editingController,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        IconButton(
            icon: const Icon(
              Icons.check,
              color: primaryColor,
              size: 18,
            ),
            tooltip: "Confirm",
            onPressed: () {
              setState(() {
                widget.todoCubit.editTodo(editingController.text, widget.index);
                isEditingEnabled = false;
              });
            }),
        IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 18,
            ),
            tooltip: "Cancel",
            onPressed: () {
              setState(() {
                isEditingEnabled = false;
              });
            })
      ],
    );

    return isEditingEnabled ? editingTodoItem : todoItem;
  }
}
