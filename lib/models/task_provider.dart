import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/components/constants.dart' as constants;

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addTask(Task task) async {
    firebaseFirestore
        .collection(constants.collectionName)
        .doc(task.id)
        .set(task.toJson());
    tasks.add(task);
    notifyListeners();
  }

  Future<void> removeTask(Task task) async {
    firebaseFirestore
        .collection(constants.collectionName)
        .doc(task.id)
        .delete();
    tasks.remove(task);
    notifyListeners();
  }

  Future<void> updateTask(Task task, String updateTask, int index) async {
    firebaseFirestore
        .collection(constants.collectionName)
        .doc(task.id)
        .update({'task': updateTask});
    tasks[index].task = updateTask;
    notifyListeners();
  }

  Stream<QuerySnapshot> readData() {
    return firebaseFirestore.collection(constants.collectionName).snapshots();
  }
}
