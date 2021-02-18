import 'package:Todo_v2/provider/todos.dart';
import 'package:Todo_v2/widget/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Todo_v2/model/todo.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider =  Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      
      itemCount: todos.length,
      itemBuilder: (context, index){
          final todo = todos[index];
          return TodoWidget(todo: todo);
      }
      );
  }
}