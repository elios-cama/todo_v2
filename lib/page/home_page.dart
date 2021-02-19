import 'package:Todo_v2/api/firebase_api.dart';
import 'package:Todo_v2/model/todo.dart';
import 'package:Todo_v2/page/add_task_page.dart';
import 'package:Todo_v2/provider/todos.dart';
import 'package:Todo_v2/widget/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     DateTime now = DateTime.now();
    String today = DateFormat('EEEE dd').format(now);
    
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [const Color(0xFF252041), const Color(0xFF1D1F25)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
                  child: AppBar(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today's Schedule",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(today,
                  style: TextStyle(
                    fontSize: 35, 
                    fontWeight: FontWeight.bold,
                    color : Color(0xFF7D41FE)
                  ),)
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            toolbarHeight: 120,
          ),
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(330),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                colors: [
                              Colors.purple.shade300,
                              Colors.purple.shade900
                            ])),
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.add, color: Colors.white, size: 35),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Icon(Icons.settings, color: Colors.white, size: 40)
                  ]),
            )),
        body: StreamBuilder<List<Todo>>(
          stream: FirebaseApi.readTodos(),
          builder: (context,snapshot){
            switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Something Went Wrong Try later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);

                return TodoListWidget();
              }
          }
          },
          
          ),
      ),
    );
  }
}
