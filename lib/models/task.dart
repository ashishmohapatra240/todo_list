import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task{
  @HiveField(0)
  final String task;
  Task(this.task);

  void addTask(Task newTask) {}
}