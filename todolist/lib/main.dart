import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomNavBar.dart';
import 'completedtasks.dart';
import 'todolist.dart';
import 'providers.dart';

void main() => runApp(const ToDoList());

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoModel(),
      child: MaterialApp(
        title: 'Midterm Exercise',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: const ToDoListScreen(),
        routes: {
          '/check' :(context)=> const CompletedTasks(),
        },
      ),
    );
  }
}

