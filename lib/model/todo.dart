import 'package:flutter/cupertino.dart';

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
  });}