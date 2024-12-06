import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List todolist = [];

  final mybox = Hive.box("mybox");

  void createInisitialData() {
    todolist = [
      ["satish", false],
      ["susanth", true],
    ];
  }

  void loadingData() {
    todolist = mybox.get("ToDoList");
  }

  void updateData() {
    mybox.put("ToDoList", todolist);
  }
}
