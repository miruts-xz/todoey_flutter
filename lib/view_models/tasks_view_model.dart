import 'package:redux/redux.dart';
import 'package:todoey_flutter/models/models.dart';
import 'package:todoey_flutter/redux/actions.dart';

class TasksViewModel {
  final List<Task> tasks;
  final int taskCount;
  final Function(String) onAddTaskAction;
  final Function(Task) onRemoveTaskAction;
  final Function(Task) onToggleDoneAction;

  TasksViewModel(
      {this.tasks,
      this.taskCount,
      this.onAddTaskAction,
      this.onRemoveTaskAction,
      this.onToggleDoneAction});

  factory TasksViewModel.create(Store<AppState> store) {
    _onAddTaskAction(String name) {
      store.dispatch(AddTaskAction(name: name));
    }

    _onRemoveTaskAction(Task task) {
      store.dispatch(RemoveTaskAction(task: task));
    }

    _onToggleDoneAction(Task task) {
      store.dispatch(ToggleDoneAction(task: task));
    }

    return TasksViewModel(
        tasks: store.state.tasks,
        taskCount: store.state.taskCount,
        onAddTaskAction: _onAddTaskAction,
        onRemoveTaskAction: _onRemoveTaskAction,
        onToggleDoneAction: _onToggleDoneAction);
  }
}
