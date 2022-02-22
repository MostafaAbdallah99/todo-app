import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/constants.dart' as constants;
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_provider.dart';
import 'package:uuid/uuid.dart';

class AddTaskScreen extends StatelessWidget {
  final bool isUpdate;
  final int index;
  final TaskProvider provider;
  const AddTaskScreen({
    required this.provider,
    required this.index,
    required this.isUpdate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    var uuid = const Uuid();
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            isUpdate
                ? constants.bottomSheetText[1]
                : constants.bottomSheetText[0],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              if (isUpdate) {
                Provider.of<TaskProvider>(context, listen: false)
                    .updateTask(provider.tasks[index], newTaskTitle!, index);
              } else {
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(Task(task: newTaskTitle!, id: uuid.v4()));
              }
              Navigator.pop(context);
            },
            child: Text(isUpdate
                ? constants.bottomSheetButtonText[1]
                : constants.bottomSheetButtonText[0]),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue[400],
              primary: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
