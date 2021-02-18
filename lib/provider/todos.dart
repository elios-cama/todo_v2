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
        type: 'Important',
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
   void addTodo(Todo todo){
     _todos.add(todo);
     notifyListeners();
   }
   void removeTodo(Todo todo){
     _todos.remove(todo);
     notifyListeners();
   }
   bool toggleTodoStatus(Todo todo){
     todo.isDone = !todo.isDone;
     notifyListeners();
     return todo.isDone;
   }

  void updateTodo(Todo todo, String title, String type, String date, String time, String category){
    todo.title = title;
    todo.type = type;
    todo.date = date;
    todo.time = time;
    todo.category = category;
    notifyListeners();
  }

}