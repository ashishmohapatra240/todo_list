import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatefulWidget {
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController task = TextEditingController();
  late bool _loading;
  late double _progressValue;
  late double initial = 0.0;
  int value = 1;
  final List<String> todoList = <String>[];
  final TextEditingController _task = TextEditingController();

  void _addTask(String task) {
    setState(() {
      todoList.add(task);
    });
    _task.clear();
  }

  Widget _stepIndicator() {
    return Container(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Level $value",
              // style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.0),
            LinearProgressIndicator(
              minHeight: 5,
              value: initial,
              // valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     if (initial >= 1) {
            //       setState(() {
            //         initial = 0;
            //         value = value + 1;
            //       });
            //     } else {
            //       setState(() {
            //         initial = initial + 0.2;
            //       });
            //     }
            //   },
            //   child: const Text('Next'),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.3;
    //initial=0.0;
  }

  Widget build(BuildContext context) {
    // app layout
    // ignore: dead_code
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To-do List'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80'),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    _stepIndicator(),
                    SizedBox(
                      height: 40.0,
                    ),

                    // ignore: prefer_const_constructors
                    //  Expanded(child: Column(

                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const Text(
                    //         'Level 1',
                    //         // ignore: prefer_const_constructors
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 18.0),
                    //       ),
                    //       SizedBox(height: 20.0),

                    //        Container(
                    //          width: 300,
                    //          child: LinearProgressIndicator(
                    //   backgroundColor: Colors.white,
                    //   // valueColor: AlwaysStoppedAnimation(Colors.green),
                    //   minHeight: 5.0,
                    //   value: initial,
                    //   // valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    // ),
                    //        ),

                    //     ],
                    //   )),
                    //     ],
                  ]),
              // ignore: dead_code
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.list),
                      title: TextField(
                        controller: _task,
                        decoration:
                            const InputDecoration(hintText: 'Enter task here'),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          if (initial >= 1) {
                            setState(() {
                              initial = 0;
                              value = value + 1;
                            });
                          } else {
                            setState(() {
                              initial = initial + 0.2;
                            });
                          }
                        },
                        child: const Text('Done'),
                      ),
                    );
                  }),
              // ignore: prefer_const_constructors
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
