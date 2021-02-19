import 'package:flutter/cupertino.dart';
import 'package:Todo_v2/utils.dart';

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String type;
  String date;
  String time;
  String category;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    this.type,
    this.id,
    this.isDone = false,
    this.category,
    this.date,
    this.time
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        id: json['id'],
        isDone: json['isDone'],
        date: json['date'],
        time: json['time'],
        category: json['category'],
        type: json['type']
      );




  Map<String, dynamic> toJson() =>{
    'title' : title,
    'id' : id,
    'type' : type,
    'date' : date,
    'time' : time,
    'category' : category,
    'isDone' : isDone,
    'CreatedTime' : Utils.fromDateTimeToJson(createdTime),
  };
  
  }