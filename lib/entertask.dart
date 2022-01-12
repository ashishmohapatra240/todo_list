import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class entertask extends StatefulWidget {
  const entertask(void Function(dynamic task) addTask, {Key? key}) : super(key: key);

  @override
  _entertaskState createState() => _entertaskState();
}

class _entertaskState extends State<entertask> {
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
