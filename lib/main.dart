import 'package:flutter/material.dart';
import 'package:future_task/model/task_data.dart';
import 'package:provider/provider.dart';
import './task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Futute Task',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
