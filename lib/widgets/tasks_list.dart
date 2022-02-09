import 'package:flutter/material.dart';
import '../providers/task_data.dart';
import 'package:future_task/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: taskData.taskCount == 0
          ? Center(
              child: Text(
              "No Task to do for Today!!",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ))
          : ListView.builder(
              itemBuilder: (context, index) {
                final task = taskData.tasks[index];
                return TasksTile(
                  isChecked: task.isDone,
                  taskTitle: task.name,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                );
              },
              itemCount: taskData.taskCount,
            ),
    );
  }
}
