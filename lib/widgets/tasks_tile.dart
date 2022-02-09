import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  TasksTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback as Function(),
      leading: Icon(
        isChecked ? Icons.done : Icons.cancel_outlined,
        size: 30,
        color: isChecked
            ? Color.fromARGB(255, 255, 255, 255)
            : Color.fromARGB(255, 255, 0, 0),
      ),
      title: Text(
        taskTitle.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.black,
        value: isChecked,
        onChanged: checkboxCallback as Function(void),
      ),
    );
  }
}
