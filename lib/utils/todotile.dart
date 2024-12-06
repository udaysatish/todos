import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? removeTask;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.removeTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: removeTask,
            backgroundColor: Colors.red.shade300,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8),
          )
        ]),
        child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 211, 100),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                //checkbox
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Expanded(
                  child: Text(
                    taskName,
                    style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: const Color.fromARGB(255, 27, 24, 24)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
