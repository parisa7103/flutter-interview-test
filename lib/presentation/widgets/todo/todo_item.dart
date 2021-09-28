import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  String title;

  TodoItem({required this.title}) : super();

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  var value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
          },
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Text(widget.title),
        ),
      ],
    );
  }
}
