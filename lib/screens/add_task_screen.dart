import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todoey_flutter/models/models.dart';
import 'package:todoey_flutter/redux/actions.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({
    Key key,
  }) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              textAlign: TextAlign.center,
            ),
            StoreConnector<AppState, Store<AppState>>(
              converter: (store) => store,
              builder: (context, store) => FlatButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  store.dispatch(
                    AddTaskAction(
                        id: store.state.taskCount, name: _controller.text),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
