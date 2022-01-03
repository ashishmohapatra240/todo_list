import 'package:flutter/material.dart';
import 'package:todo_app/entertask.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String? task;

  void addValue(String value){
    task=value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Task",
                    // border: InputBorder.none,
                  ),
                  onSubmitted: (String value){
                    addValue(value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop({task});
                  },
                  child: Text('Add Task'),
                ),
                Entertask(),
                Entertask(),
                Entertask(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
