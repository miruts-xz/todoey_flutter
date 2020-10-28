import 'package:todoey_flutter/models/models.dart';

class AddTaskAction {
  final int id;
  final String name;

  AddTaskAction({this.id, this.name});
}

class RemoveTaskAction {
  final Task task;

  RemoveTaskAction({this.task});
}

class ToggleDoneAction {
  final Task task;

  ToggleDoneAction({this.task});
}

class GetTasksAction {}

class LoadedTasksAction {
  List<Task> tasks;

  LoadedTasksAction({this.tasks});
}
