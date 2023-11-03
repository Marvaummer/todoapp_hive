import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_hive/widgets/Tabs.dart';

void main() {
  runApp(MaterialApp(
    home: Homieeezz(),
  ));
}

class Homieeezz extends StatefulWidget {
  @override
  _HomieeezzState createState() => _HomieeezzState();
}

class _HomieeezzState extends State<Homieeezz> {
  String searchValue = '';
  List<String> _suggestions = ['apple', 'orange', 'grapes', 'banana'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: Text("bhyjg"),
        onSearch: (value) {
          setState(() {
            searchValue = value;
          });
        },
      ),
      body: Taabbox(),
    );
  }
}


