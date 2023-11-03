import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp_hive/screens/task_screen.dart';
import 'package:todoapp_hive/search%20box/search.dart';
import 'package:todoapp_hive/widgets/Tabs.dart';
import 'package:todoapp_hive/widgets/drawer.dart';


import 'models/task_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Task>('tasks');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Drawerr(),
    );
  }
}