import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_list/provider/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de texto
    _controller.addListener(() {
      setState(() {}); // Actualiza el estado cuando el texto cambia
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(child:
              Consumer<TodoProvider>(builder: (context, todoProvider, child) {
            return ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        todoProvider.toggleDone(index);
                      }),
                  trailing: IconButton(
                      onPressed: () {
                        todoProvider.delete(index);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }))
        ],
      ),
    );
  }
}
