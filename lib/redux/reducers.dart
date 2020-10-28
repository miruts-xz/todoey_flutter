import 'package:todoey_flutter/models/models.dart';
import 'package:todoey_flutter/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(tasks: taskReducer(state.tasks, action));
}

List<Task> taskReducer(List<Task> tasks, action) {
  if (action is AddTaskAction) {
    return []
      ..addAll(tasks)
      ..insert(
        0,
        Task(name: action.name),
      );
  } else if (action is RemoveTaskAction) {
    return []
      ..addAll(tasks)
      ..remove(action.task);
  } else if (action is ToggleDoneAction) {
    int taskIndex = tasks.indexOf(action.task);
    Task updatedTask = action.task;
    updatedTask.toggleDone();
    return []
      ..addAll(tasks)
      ..remove(action.task)
      ..insert(taskIndex, updatedTask);
  } else if (action is LoadedTasksAction) {
    return action.tasks;
  } else {
    return tasks;
  }
}
