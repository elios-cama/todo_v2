import 'package:Todo_v2/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Todo_v2/widget/type_button.dart';
import 'package:Todo_v2/constants.dart';
import 'package:Todo_v2/widget/time_button.dart';
import 'package:intl/intl.dart';
import 'package:Todo_v2/widget/category_button.dart';
import 'package:Todo_v2/model/todo.dart';
import 'package:provider/provider.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
class EditTaskScreen extends StatefulWidget {
  String title;
  bool importantButtonState = true;
  bool plannedButtonState = false;
  String type;
  String category;
  bool foodButtonState = false;
  bool workoutButtonState = false;
  bool workButtonState = false;
  bool designButtonState = false;
  bool runButtonState = false;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);
  String dayDate;
  String dayTime;
  String dateTitle = 'Select a date';
  String timeTitle = 'Select Time';
  Function onSavedTodo;
  EditTaskScreen({
    this.title,
    this.importantButtonState,
    this.plannedButtonState,
    this.type,
    this.category,
    this.foodButtonState,
    this.workButtonState,
    this.workoutButtonState,
    this.designButtonState,
    this.runButtonState,
    this.date,
    this.time,
    this.dayDate,
    this.dayTime,
    this.dateTitle,
    this.timeTitle,
    this.onSavedTodo
  });
  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  String title;
  bool importantButtonState = false;
  bool plannedButtonState = false;
  String type;
  String category;
  bool foodButtonState = false;
  bool workoutButtonState = false;
  bool workButtonState = false;
  bool designButtonState = false;
  bool runButtonState = false;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);
  String dayDate;
  String _dayTime;
  String dateTitle = 'Select a date';
  String timeTitle = 'Select Time';


  void InitType(String type){
    if(widget.type =='Important'){
      importantButtonState = true;
      plannedButtonState = false;
    }else{
      plannedButtonState = true;
      importantButtonState = false;
    }
  }

  

  void setCategoryButtonState() {
    foodButtonState = false;
    workoutButtonState = false;
    workButtonState = false;
    designButtonState = false;
    runButtonState = false;
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
      context: context,
      initialDate: date,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date)
      setState(() {
        //print(new DateFormat.yMMMd().format(new DateTime.now()));
        date = picked;
        dayDate = DateFormat.Md().format(date);
        dateTitle = dayDate;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
      context: context,
      initialTime: time,
    );
    if (picked != null)
      setState(() {
        time = picked;
        _dayTime = '${time.hour}:${time.minute}';
        timeTitle = _dayTime;
      });
  }

  void initCategory(String category){
    switch (category) {
      case 'Food':
        {
          foodButtonState = true;
        }
        break;

      case 'Workout':
        {
         workoutButtonState = true;
        }
        break;
      case 'Work':
        {
          workButtonState = true;
        }
        break;
      case 'Design':
        {
          designButtonState = true;
        }
        break;
      case 'Run':
        {
          runButtonState = true;
        }
        break;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
    InitType(widget.type);
    dateTitle = widget.dayDate;
    timeTitle = widget.dayTime;
    initCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade900,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top : 20, bottom : 20),
                  child: FlatButton(
                    child: Icon(FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                    size: 30,),
                    onPressed: () => Navigator.pop(context)
                    ),
                ),
                Text('Edit \nYour task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top : 20, bottom :25),
                  child: TextField(
                    
                    style: TextStyle(color: Colors.grey.shade700),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey.shade700),
                        hintText: title,
                        fillColor: Color(0xFF292E3C)),
                    onChanged: (value) {
                      setState(() {
                         title = value;
                      });
                     
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( bottom :20),
                  child: Text('Type', style: kTextDecoration),
                ),
                Row(
                  children: [
                    TypeButton(
                      type: 'Important',
                      fonction: () => setState(() {
                        importantButtonState = !importantButtonState;
                        plannedButtonState = !plannedButtonState;
                        type = 'important';
                      }),
                      size: 98,
                      colour: importantButtonState
                          ? Color(0xFF3532B6)
                          : Colors.transparent,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    TypeButton(
                      type: 'Planned',
                      fonction: () => setState(() {
                        plannedButtonState = !plannedButtonState;
                        importantButtonState = !importantButtonState;
                        type = 'planned';
                      }),
                      size: 88,
                      colour: plannedButtonState
                          ? Color(0xFF3532B6)
                          : Colors.transparent,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top :20, bottom : 20),
                  child: Text('Choose date & time', style: kTextDecoration),
                ),
                Row(
                  children: [
                    TimeButton(
                      dateTitle,
                      FontAwesomeIcons.calendar,
                      () => _selectDate(context),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TimeButton(
                      timeTitle,
                      FontAwesomeIcons.clock,
                      () => _selectTime(context),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top :20, bottom : 20),
                  child: Text('Category', style: kTextDecoration),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CategoryButton(
                            colour: Color(0xFFFE6D6E),
                            title: 'Food',
                            size: 70,
                            fonction: () => setState(() {
                              setCategoryButtonState();
                              foodButtonState = !foodButtonState;
                              category = 'Food';
                            }),
                            borderColor: foodButtonState
                                ? Colors.grey.shade700
                                : Colors.transparent,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          CategoryButton(
                            colour: Color(0xFFF19731),
                            title: 'Workout',
                            size: 90,
                            fonction: () => setState(() {
                              setCategoryButtonState();
                              workoutButtonState = !workoutButtonState;
                              category = 'Workout';
                            }),
                            borderColor: workoutButtonState
                                ? Colors.grey.shade700
                                : Colors.transparent,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          CategoryButton(
                            colour: Color(0xFF6457FF),
                            title: 'Work',
                            size: 70,
                            fonction: () => setState(() {
                              setCategoryButtonState();
                              workButtonState = !workButtonState;
                              category = 'Work';
                            }),
                            borderColor: workButtonState
                                ? Colors.grey.shade700
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CategoryButton(
                          colour: Color(0xFF234EBC),
                          title: 'Design',
                          size: 80,
                          fonction: () => setState(() {
                            setCategoryButtonState();
                            designButtonState = !designButtonState;
                            category = 'Design';
                          }),
                          borderColor: designButtonState
                              ? Colors.grey.shade700
                              : Colors.transparent,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        CategoryButton(
                          colour: Color(0xFF2BC8D9),
                          title: 'Run',
                          size: 64,
                          fonction: () => setState(() {
                            setCategoryButtonState();
                            runButtonState = !runButtonState;
                            category = 'Run';
                          }),
                          borderColor: runButtonState
                              ? Colors.grey.shade700
                              : Colors.transparent,
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top :40, bottom : 10),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("lib/images/button_fond.png"),
                            fit: BoxFit.cover)),
                    child: FlatButton(
                        onPressed: () {
                          print('tis is $dayDate');
                          print(widget.dayDate);
                          final todo = Todo(
                              createdTime: DateTime.now(),
                              title: title,
                              type: type,
                              date: dayDate,
                              time: _dayTime,
                              category: category,
                          );
                          final provider  = Provider.of<TodosProvider>(context, listen: false);
                          print(dayDate);
                          provider.updateTodo(todo, title, type, dayDate, _dayTime, category);
                          Navigator.pop(context);
                        },
                        
                        
                        child: Text('Update Task', style: kTextDecoration)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
