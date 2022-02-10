import 'package:flutter/material.dart';
import 'package:future_task/providers/theme.dart';
import '../providers/task_data.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTheme = Provider.of<ThemeProvider>(context, listen: false);
    String newTaskTitle = '';
    return Container(
      color:
          newTheme.isDarkMode ? Colors.black : Color.fromARGB(26, 244, 67, 54),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                decoration: InputDecoration(),
                cursorColor: Theme.of(context).textTheme.bodyMedium?.color,
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  final newtask = Provider.of<TaskData>(context, listen: false);
                  newtask.addTask(newTaskTitle);
                  Navigator.pop(context);
                  if (newTaskTitle.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text('Task can not be empty!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
