import 'package:Todo_v2/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:Todo_v2/page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
          child: MaterialApp(
        debugShowCheckedModeBanner : false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.purple.shade900
        ),
        home: HomePage(),
      ),
    );
  }
}