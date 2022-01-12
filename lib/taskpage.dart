import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/entertask.dart';

import 'models/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();

  Future<void> addTask(task) async {
    await Hive.openBox("task");
    final taskBox = Hive.box('task');
    taskBox.add(task);
  }

  String? task;

  void addValue(String value) {
    task = value;
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
                  onSubmitted: (String value) {
                    addValue(value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pop({task});
                    _formKey.currentState!.save();
                    final newTask = Task(task!);
                    addTask(newTask);
                  },
                  child: Text('Add Task'),
                ),
                entertask(addTask),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
