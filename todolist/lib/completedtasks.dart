import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bottomNavBar.dart';
import 'package:todolist/main.dart';
import 'package:todolist/providers.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks>{
  int currentIndex = 2;


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ToDoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Completed Things to Do'),
      ),
      body: ListView.builder(
          itemCount: model.checkedItems.length,
          itemBuilder: (context, index) {
            final checkedItem = model.checkedItems[index];
            return Card(
                color: Colors.green,
                child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: ListTile(
                        title: Text(checkedItem.title),
                        subtitle: Text(checkedItem.description),
                        trailing: const SizedBox(
                          width: 100,
                        )
                    )
                )
            );
          }),
    );
  }
}
