// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'completedtasks.dart';
import 'todolist.dart';
import 'providers.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  int currentIndex = 0;

  static final List<Widget> screens = [
    ToDoApp(),
    CompletedTasks()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ToDoModel>(context);
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: _onItemTapped,
        backgroundColor: Colors.pink,
        tabs: [
          GButton(
            icon: Icons.list,
            text: 'To-Do List',
            textColor: Colors.white,
            iconColor: Colors.white,
            iconActiveColor: Colors.white54,
          ),
          GButton(
            icon: Icons.check,
            text: 'Completed Tasks',
            textColor: Colors.white,
            iconColor: Colors.white,
            iconActiveColor: Colors.white54,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              contentPadding: const EdgeInsets.all(20),
              children: [
                TextField(
                  controller: model.inputController,
                  decoration: const InputDecoration(
                    hintText: "Type in what you want to do",
                  ),
                ),
                TextField(
                  controller: model.descController,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                  minLines: 1,
                  maxLines: null,
                ),
                ElevatedButton(
                  onPressed: () {
                    model.add(ToDo(
                      title: model.inputController.text,
                      description: model.descController.text,
                    ));
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
