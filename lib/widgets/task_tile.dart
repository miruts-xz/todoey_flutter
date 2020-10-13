import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final ValueChanged<bool> toggleCheckbox;
  final VoidCallback longPressCallback;

  TaskTile(
      {Key key,
      @required this.isChecked,
      this.taskTitle,
      this.toggleCheckbox,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(taskTitle),
      background: Container(
        color: Colors.red,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Delete",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              )
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        longPressCallback();
      },
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: toggleCheckbox,
        ),
      ),
    );
  }
}
