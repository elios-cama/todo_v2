import 'package:Todo_v2/page/add_task_page.dart';
import 'package:Todo_v2/widget/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 15),
            child: FlatButton(
              onPressed: () {},
              child: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text("To do List",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
      ),
      bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.house,
                      color: Colors.white,
                      size: 40,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTaskScreen()));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.add, color: Colors.white, size: 35),
                        backgroundColor: Colors.purple.shade400,
                      ),
                    ),
                    Icon(Icons.settings, color: Colors.white, size: 40)
                  ]),
            )),
      body: TodoListWidget(),
    );
  }
}
