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
  final _taskController = TextEditingController();

  Future<void> addTask(Task task) async {
    print(task.task);
    final taskBox = Hive.box('task');
    taskBox.add(task);
  }

  String task = "";

  void addValue(String value) {
    setState(() {
      task = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  hintText: "Enter Task",
                  // border: InputBorder.none,
                ),
                onSubmitted: (String value) {
                  addValue(_taskController.text);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  final newTask = Task(_taskController.text);
                  addTask(newTask);
                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
              Entertask(addTask),
            ],
          ),
        ),
      ),
    );
  }
}
