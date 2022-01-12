import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/taskpage.dart';

import 'models/task.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController task = TextEditingController();
  late bool loading;
  late double progressValue;
  late double initial = 0.0;
  int value = 1;
  final List<String> todoList = <String>[];
  final TextEditingController _task = TextEditingController();

  Future<void> addTask(String task) async {
    setState(() {
      todoList.add(task);
    });
    _task.clear();
  }

  Widget _stepIndicator() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Level $value",
          ),
          const SizedBox(height: 20.0),
          LinearProgressIndicator(
            minHeight: 5,
            value: initial,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loading = false;
    progressValue = 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do List'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80'),
                  radius: 30,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                _stepIndicator(),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
            // ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         leading: const Icon(Icons.list),
            //         title: TextField(
            //           controller: _task,
            //           decoration:
            //               const InputDecoration(hintText: 'Enter task here'),
            //         ),
            //         trailing: ElevatedButton(
            //           onPressed: () {
            //             if (initial >= 1) {
            //               setState(() {
            //                 initial = 0;
            //                 value = value + 1;
            //               });
            //             } else {
            //               setState(() {
            //                 initial = initial + 0.2;
            //               });
            //             }
            //           },
            //           child: const Text('Done'),
            //         ),
            //       );
            //     })
            Expanded(
              child: _buildListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

ListView _buildListView() {
  final taskBox = Hive.box('task');
  return ListView.builder(
    itemCount: taskBox.length,
    itemBuilder: (BuildContext context, int index) {
      final task =taskBox.get(index) as Task;
      return ListTile(
        title: Text(task.task),
      );
    },
  );
}
