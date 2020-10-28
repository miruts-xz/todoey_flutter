import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey_flutter/models/models.dart';
import 'package:todoey_flutter/redux/actions.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await prefs.setString('tasksState', string);
}

Future<AppState> loadFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String string = prefs.getString('tasksState');
  if (string != null) {
    return AppState.fromJson(json.decode(string));
  }
  return AppState.initialState();
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  if (action is AddTaskAction ||
      action is RemoveTaskAction ||
      action is ToggleDoneAction) {
    saveToPrefs(store.state);
  }
  if (action is GetTasksAction) {
    await loadFromPrefs()
        .then((state) => store.dispatch(LoadedTasksAction(tasks: state.tasks)));
  }
}
