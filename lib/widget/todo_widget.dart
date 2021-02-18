import 'package:Todo_v2/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  TodoWidget({@required this.todo});

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  IconData icon;
  bool isFood = false;
  Color iconBackgroundColor;

  void chooseIcon(String category) {
    switch (category) {
      case 'Food':
        {
          icon = FontAwesomeIcons.hamburger;
          iconBackgroundColor = Colors.white;
          isFood = true;
        }
        break;

      case 'Workout':
        {
          icon = FontAwesomeIcons.dumbbell;
          iconBackgroundColor = Colors.orange;
        }
        break;
      case 'Work':
        {
          icon = FontAwesomeIcons.chartLine;
          iconBackgroundColor = Colors.blue.shade900;
        }
        break;
      case 'Design':
        {
          icon = FontAwesomeIcons.pencilAlt;
          iconBackgroundColor = Colors.green;
        }
        break;
      case 'Run':
        {
          icon = FontAwesomeIcons.running;
          iconBackgroundColor = Colors.yellow;
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    chooseIcon(widget.todo.category);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
          key: Key(widget.todo.id),
        actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: (){},
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: (){},
              icon: Icons.delete,
            )
          ],




          child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.5,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.5,
                          color: Colors.grey.shade700,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Color(0xFF292E3C),
                        ),
                        child: Checkbox(
                          value: widget.todo.isDone,
                          onChanged: (bool isDone) {
                            setState(() {
                              widget.todo.isDone = !widget.todo.isDone;
                            });
                          },
                          activeColor: Color(0xFF65FFA7),
                          checkColor: Colors.black,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(

              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: widget.todo.isDone ? Color(0xFF2765FA) : Color(0xFF292E3C)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: iconBackgroundColor),
                        child: Icon(
                          icon,
                          size: 23,
                          color: isFood ? Colors.red : Colors.white,
                        )),
                    Text(
                      widget.todo.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),

                    Column(
                      children: [
                        Text(
                          widget.todo.time,
                          style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                        ),
                        Text(widget.todo.date)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}