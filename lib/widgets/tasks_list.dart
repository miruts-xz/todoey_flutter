import 'package:flutter/material.dart';
import 'package:todoey_flutter/view_models/tasks_view_model.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  final TasksViewModel model;

  TasksList({this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.taskCount,
      itemBuilder: (context, index) {
        final task = model.tasks[index];
        return TaskTile(
          key: Key(task.toString()),
          taskTitle: task.name,
          isChecked: task.isDone,
          toggleCheckbox: (value) {
            model.onToggleDoneAction(task);
          },
          longPressCallback: () {
            model.onRemoveTaskAction(task);
          },
        );
      },
    );
  }
}
