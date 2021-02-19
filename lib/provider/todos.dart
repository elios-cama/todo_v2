import 'package:Todo_v2/api/firebase_api.dart';
import 'package:Todo_v2/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:Todo_v2/api/firebase_api.dart';

class TodosProvider extends ChangeNotifier{
   List<Todo> _todos = [];
   List<Todo> get todos {
     return _todos;
   }
   void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  void setTodos(List<Todo> todos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

   void removeTodo(Todo todo) => FirebaseApi.deleteTodo(todo);


   bool toggleTodoStatus(Todo todo){
     todo.isDone = !todo.isDone;
     FirebaseApi.updateTodo(todo);
     return todo.isDone;
   }

  void updateTodo(Todo todo, String title, String type, String date, String time, String category){
    todo.title = title;
    todo.type = type;
    todo.date = date;
    todo.time = time;
    todo.category = category;
    FirebaseApi.updateTodo(todo);
  }

}