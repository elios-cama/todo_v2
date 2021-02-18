import 'package:Todo_v2/model/todo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:Todo_v2/page/add_task_page.dart';
import 'package:flutter/material.dart';
import 'package:Todo_v2/page/edit_task_page.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({ @required this.todo});
  @override

  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title;
  String type;
  String date;
  String time;
  String category;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.todo.title;
    type = widget.todo.type;
    date = widget.todo.date;
    time = widget.todo.time;
    category = widget.todo.category;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: EditTaskScreen(
        title: widget.todo.title,
        type: widget.todo.type,
        category: widget.todo.category,
        dayDate : widget.todo.date,
        dayTime: widget.todo.time,
        
        

      ),
    );
  }
}