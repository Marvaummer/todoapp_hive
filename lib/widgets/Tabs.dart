
import 'package:flutter/material.dart';

import '../screens/task_screen.dart';

class Taabbox extends StatefulWidget {
  @override
  _TaabboxState createState() => _TaabboxState();
}

class _TaabboxState extends State<Taabbox> {
  TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs

      child: Scaffold(//search box color

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal,Colors.white, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchTerm = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Container(

                      width: 190,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26), // Add a border
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [Colors.deepPurple,Colors.teal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                        // Add rounded corners
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Task Note',
                          style: TextStyle(color: Colors.white70,fontWeight:
                          FontWeight.bold,fontSize: 20)
                          , // Change
                          // text color
                        ),
                      ),
                    ),
                  ),
                  //Tab(text: 'Tasks'),
                ],),
                // indicator: BoxDecoration(
                //   borderRadius:BorderRadius.circular(60),
                //  gradient:  LinearGradient(
                //    colors: [Colors.deepPurple, Colors.teal],
                //    begin: Alignment.topLeft,
                //    end: Alignment.bottomRight,
                //  ),),
                // ),
                 // Set the color of the selected tab label

              Expanded(
                child: TabBarView(
                  children: [
                    // Create a widget for the "Tasks" tab with a filter
                    TasksScreen(),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


