import 'package:flutter/cupertino.dart';

class entertask extends StatefulWidget {
  const entertask({Key? key}) : super(key: key);

  @override
  _entertaskState createState() => _entertaskState();
}

class _entertaskState extends State<entertask> {
  final _formKey = GlobalKey<FormState>();
  String _task='';
  entertask newTask = new entertask();


void addTask(task){

}

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[],
        ));
  }
}
