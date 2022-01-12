import 'package:flutter/material.dart';
import 'package:todo_app/Todo.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_app/models/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter(), );
  runApp(const MyApp());

  final taskBox = await Hive.openBox('task');
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box('task');
    return MaterialApp(
        title: 'Todo App',
        home: FutureBuilder(
            future: Hive.openBox('task'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError)
                  return Text(snapshot.error.toString());
                else
                  return Todo();
              } else
                return Scaffold();
            }));
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}