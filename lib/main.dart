import 'package:flutter/material.dart';
import 'package:todolist/Screens/homescreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures Flutter bindings are initialized
  await Hive.initFlutter(); // Initializes Hive
  await Hive.openBox('mybox'); // Replace 'yourBoxName' with the box name

  // await Hive.initFlutter();

  // var box = Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
