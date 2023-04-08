import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ToDo {
  final String title;
  final String description;

  ToDo({
    required this.title,
    required this.description,
  });
}

class ToDoModel with ChangeNotifier {
  final List<ToDo> _todos = [];
  final List<ToDo> _checkedItems = [];
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  List<ToDo> get todos => _todos;

  List<ToDo> get checkedItems => _checkedItems;

  TextEditingController get inputController => _inputController;
  TextEditingController get descController => _descController;

  void add(ToDo todo) {
    _todos.add(todo);
    _inputController.clear();
    _descController.clear();
    notifyListeners();
  }

  void remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateTitle(int index, String value) {
    _todos[index] = _todos[index].copyWith(title: value);
    notifyListeners();
  }

  void updateDescription(int index, String value) {
    _todos[index] = _todos[index].copyWith(description: value);
    notifyListeners();
  }

  void check(int index, ToDo todo) {
    _todos.removeAt(index);
    _checkedItems.add(todo);
    notifyListeners();
  }
}

extension ToDoExtension on ToDo {
  ToDo copyWith({
    String? title,
    String? description
  }) {
    return ToDo(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
