import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_provider.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, value, index) {
        final Stream<QuerySnapshot> _stream = value.readData();
        return StreamBuilder(
            stream: _stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                value.tasks.clear();
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> document = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    value.tasks
                        .add(Task(task: document['task'], id: document['id']));
                    return TaskTile(
                      taskTile: value.tasks[index].task,
                      deleteTile: () => value.removeTask(value.tasks[index]),
                      getIndex: () => index,
                      provider: value,
                    );
                  });
            });
      },
    );
  }
}
