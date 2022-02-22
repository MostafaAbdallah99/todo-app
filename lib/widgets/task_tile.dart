import 'package:flutter/material.dart';
import 'package:todo_app/models/task_provider.dart';
import 'package:todo_app/screens/add_task_screen.dart';

class TaskTile extends StatelessWidget {
  final String taskTile;
  final void Function() deleteTile;
  final int Function() getIndex;
  final TaskProvider provider;
  const TaskTile(
      {Key? key,
      required this.provider,
      required this.taskTile,
      required this.deleteTile,
      required this.getIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = getIndex();
    return ListTile(
        title: Text(taskTile),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      child: AddTaskScreen(
                        provider: provider,
                        index: index,
                        isUpdate: true,
                      ),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
            IconButton(
              onPressed: deleteTile,
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ],
        ));
  }
}
