import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/task.dart';

class Entertask extends StatefulWidget {
  const Entertask(void Function(Task task) addTask, {Key? key}) : super(key: key);

  @override
  _EntertaskState createState() => _EntertaskState();
}

class _EntertaskState extends State<Entertask> {
  final _formKey = GlobalKey<FormState>();
  String task='';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[],
        ));
  }
}
