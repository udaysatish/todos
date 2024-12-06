import 'package:flutter/material.dart';
import 'package:todolist/utils/button.dart';

class DialogPage extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogPage({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter a new task",
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "save", onPressed: onSave),
                SizedBox(
                  width: 10,
                ),
                MyButton(text: "cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
