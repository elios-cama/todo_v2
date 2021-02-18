import 'package:Todo_v2/model/todo.dart';
import 'package:flutter/cupertino.dart';

class TodosProvider extends ChangeNotifier{
   List<Todo> _todos = [
     Todo(
       createdTime: DateTime.now(),
        title: 'Go to the gym',
        type: 'planned',
        date: '22/02',
        time : '11:45',
        category: 'Workout',
        
        ),
      Todo(
       createdTime: DateTime.now(),
        title: 'Make dinner',
        type: 'important',
        date: '22/02',
        time : '19:45',
        category: 'Food',
        
        ),
      Todo(
       createdTime: DateTime.now(),
        title: 'Finish the app',
        type: 'important',
        date: '26/02',
        time : '11:00',
        category: 'Work',
        
        )
   ];
   List<Todo> get todos {
     return _todos;
   }
}