import 'package:flutter/material.dart';
import 'package:todoapp_hive/screens/setting%20page.dart';
import 'package:todoapp_hive/widgets/Tabs.dart';


void main() {
  runApp(Drawerr());
}

class Drawerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.black26,Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Center(
          child: Text("Todo App",style: TextStyle(fontSize: 25,fontWeight:
          FontWeight.bold),),
        ),
      ),
      drawer: Drawer(backgroundColor: Colors.white70,

        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/bg clr.jpeg"),
                  )
              ),

              accountName: Text("John Doe",style: TextStyle(color: Colors
                  .white70,fontSize: 20),),
              accountEmail: Text("John@gmail.com",style: TextStyle
                (color: Colors.white70,fontSize: 18),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dp pic.png"),
               // backgroundColor: Colors.grey,

              ),

            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline_outlined),
              title: Text("Tasks",style: TextStyle(fontSize: 18),),
              onTap: () {
                // Handle the Home menu item click
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.note_alt_outlined),
              title: Text("Notes",style: TextStyle(fontSize: 18),),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder:
                //   (context)=>NoteTask()));
                // Handle the Home menu item click
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings",style: TextStyle(fontSize: 18),),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsPage()));
                // Handle the Settings menu item click
               // Navigator.pop(context);
              },
            ),


            // Add more drawer items as needed
          ],
        ),
      ),
      body: Taabbox() ,

    );
  }
}
