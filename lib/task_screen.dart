import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/add_new_task.dart';
import './widgets/tasks_list.dart';
import 'model/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Future Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).taskCount} tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddNewTask(),
          );
          const snackBar = SnackBar(
            content: Text('Task can not be empty!'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
