import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_test/bloc/todo/todo_cubit.dart';
import 'package:flutter_interview_test/presentation/screens/ToDo/todo.dart';
import 'package:flutter_interview_test/presentation/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: primaryColor,  unselectedWidgetColor: Colors.grey, // <-- your color
      ),

      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: Todo(),
      ),
    );
  }
}
