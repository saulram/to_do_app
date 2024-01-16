import 'package:isar/isar.dart';
part 'todo_model.g.dart';

@Collection()
class ToDo{
  Id id = Isar.autoIncrement;
  String title;
  String? description;
  bool isDone;
  ToDo({
    required this.title,
    this.description,
    this.isDone = false,
  });

}

