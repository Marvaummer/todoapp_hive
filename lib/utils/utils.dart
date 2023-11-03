import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/add_taskdialogue.dart';


Future<Task?> openAddTaskDialog({
  required BuildContext context,
  Task? task,
}) {
  return showDialog<Task?>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AddTaskDialog(
        task: task,
      );
    },
  );
}