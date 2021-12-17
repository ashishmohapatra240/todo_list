import 'package:flutter/material.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatefulWidget {
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late bool _loading;  
  late double _progressValue;  
  final double initial=0.0;

  void update(){

  }
  Widget _stepIndicator(){
    return Column(
      children: [
        Text(
          "Level 1"),
        SizedBox(height:20.0),
        LinearProgressIndicator(
          minHeight: 5,
        ),
        SizedBox(height:20),
        TextButton(onPressed: (){}, child: Text(
          'Next'
          ),
        ),
        

      ],
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
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('To-do List'),
          ),
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80'),
                      radius: 30,
                    ),
                    SizedBox(width: 20.0,),
                    // _stepIndicator(),

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
              //          child: const LinearProgressIndicator(  
              //   backgroundColor: Colors.white,
              //   valueColor: AlwaysStoppedAnimation(Colors.green),
              //   minHeight: 5.0,
              //   value: initial,
              //   // valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              // ),
              //        ),  

              //     ],
              //   )),    
              //     ],
              //   )
              ],
            ),
              ]),
          ),
    ));
  }}