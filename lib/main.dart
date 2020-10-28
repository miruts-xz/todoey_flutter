import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todoey_flutter/models/models.dart';
import 'package:todoey_flutter/redux/actions.dart';
import 'package:todoey_flutter/redux/middleware.dart';
import 'package:todoey_flutter/redux/reducers.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(appStateReducer,
      initialState: AppState.initialState(), middleware: [appStateMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(GetTasksAction()),
          builder: (context, store) => TasksScreen(store),
        ),
      ),
    );
  }
}
