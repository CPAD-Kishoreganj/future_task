import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/add_new_task.dart';
import '../widgets/tasks_list.dart';
import '../providers/task_data.dart';
import '../widgets/theme_switch.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: ChangeThemeButtonWidget(),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Future Task",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                  Consumer<TaskData>(
                    builder: (context, value, child) => Text(
                      "${task.taskCount} tasks",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
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
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddNewTask(),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
