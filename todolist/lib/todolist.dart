// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'bottomNavBar.dart';
import 'completedtasks.dart';
import 'providers.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ToDoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      body: ListView.builder(
        itemCount: model.todos.length,
        itemBuilder: (context, index) {
          final todo = model.todos[index];
          return Card(
            color: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                contentPadding: const EdgeInsets.all(20),
                                children: [
                                  TextField(
                                    onChanged: (value) {
                                      model.updateTitle(index, value);
                                    },
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      model.updateDescription(index, value);
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Type in the description'),
                                    minLines: 1,
                                    maxLines: null,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Update"),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            model.remove(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            model.check(index, todo);
                            Navigator.of(context).pushNamed('/check');
                          },
                          icon: const Icon(Icons.check),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
