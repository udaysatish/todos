import 'package:flutter/material.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/utils/dialog.dart';
import 'package:todolist/utils/todotile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mybox = Hive.box("mybox");

  final _controller = TextEditingController();

  Database db = Database();
  @override
  void initState() {
    if (_mybox.get("ToDoList") == null) {
      db.createInisitialData();
    } else {
      db.loadingData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void creatPage() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogPage(
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveTask,
            controller: _controller,
          );
        });
  }

  void deleteFunction(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 255, 157),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 231, 211, 100),
        title: Text(
          "All Tasks",
          style: TextStyle(
            color: Color.fromARGB(134, 243, 57, 6),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: creatPage,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todolist[index][0],
            taskCompleted: db.todolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            removeTask: (context) => deleteFunction(index),
          );
        },
      ),
    );
  }
}
