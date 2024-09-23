import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoProvider() {
    loadTodos();
  }

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    _saveTodo();
    notifyListeners();
  }

  void toggleDone(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    _saveTodo();
    notifyListeners();
  }

  void delete(int index) {
    _todos.removeAt(index);
    _saveTodo();
    notifyListeners();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString('todos');
    if (todosString != null) {
      final List<dynamic> todosJson = jsonDecode(todosString);
      _todos = todosJson.map((todo) => Todo.fromJson(todo)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTodo() async {
    final prefs = await SharedPreferences.getInstance();
    final String todosString =
        jsonEncode(_todos.map((todo) => todo.toJson()).toList());
    await prefs.setString('todos', todosString);
  }
}
