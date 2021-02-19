import 'package:Todo_v2/provider/todos.dart';
import 'package:Todo_v2/widget/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Todo_v2/model/todo.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(child: Text("There's no tasks yet", style: TextStyle(color: Colors.white, fontSize: 15),))
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            });
  }
}
