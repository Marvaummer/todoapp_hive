import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/task_model.dart';
import '../widgets/task_listtile.dart';
import '/utils/utils.dart';


class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal, Colors.white70,Colors.teal],
            begin: Alignment.topLeft,

            end: Alignment.bottomRight,
          ),
        ),

        child: ValueListenableBuilder(
            valueListenable:Hive.box<Task>('tasks').listenable(),
            builder: (context, box, child) {

              final tasks =box.values;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {

                  final task = tasks.elementAt(index);
                  return TaskListTile(
                    task: task,
                    onDelete: () {
                      Hive.box<Task>('tasks').delete(task.id);
                    },
                    onEdit: () async {
                      final newTask = await openAddTaskDialog(
                        context: context,
                        task: task,
                      );
                      if (newTask != null) {
                        Hive.box<Task>('tasks').put(task.id, newTask);
                      }
                      setState(() {});
                    },
                    onCheckboxChanged: (isChecked) {
// Update the task's completion status in Hive
                      final updatedTask = task..isCompleted = isChecked;
                      Hive.box<Task>('tasks').put(task.key, updatedTask);
                      setState(() {});
                    },
                  );
                },
    );

  } ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        onPressed: () async {
          final task = await openAddTaskDialog(context: context);
          if (task != null) {
            Hive.box<Task>('tasks').put(task.id, task);
            tasks.add(task);
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}

