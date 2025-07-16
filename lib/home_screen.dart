import 'package:flutter/material.dart';
import 'package:iti_flutter/contact_and_about_screen.dart';
import 'package:iti_flutter/greet_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(title: Text('To-do App'),bottom: TabBar(tabs: [
                  Tab(text: "Active",),
                  Tab(text: "Completed",)
                ]),),
                body: TabBarView(
                  children: [
                    Center(
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text("Task 1"),
                            leading: Icon(Icons.info),
                          ),
                          ListTile(
                            title: Text("Task 2"),
                            leading: Icon(Icons.info),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text("Task 3"),
                            leading: Icon(Icons.info),
                          ),
                          ListTile(
                            title: Text("Task 4"),
                            leading: Icon(Icons.info),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
    
    // Scaffold(
    //   drawer: Drawer(
    //     child: ListView(
    //       children: [
    //         ListTile(
    //           title: Text("Contact"),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => ContactScreen()),
    //             );
    //           },
    //         ),

    //         ListTile(
    //           title: Text("About"),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => AboutScreen()),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   appBar: AppBar(title: Text("Home Screen")),
    //   body: Center(
    //     child: Column(
    //       children: [
    //         // TextFormField(
    //         //   controller: _nameController,
    //         //   decoration: InputDecoration(
    //         //     border: OutlineInputBorder(),
    //         //     hintText: 'Enter your name',
    //         //   ),
    //         // ),

    //         // ElevatedButton(
    //         //   onPressed: () {
    //         //     Navigator.push(
    //         //       context,
    //         //       MaterialPageRoute(
    //         //         builder:
    //         //             (context) => GreetScreen(name: _nameController.text),
    //         //       ),
    //         //     );
    //         //   },
    //         //   child: Text("Greet"),
    //         // ),
    //         DefaultTabController(
    //           length: 2,
    //           child: Scaffold(
    //             appBar: AppBar(title: Text('To-do App'),bottom: TabBar(tabs: [
    //               Tab(text: "Active",),
    //               Tab(text: "Completed",)
    //             ]),),
    //             body: TabBarView(
    //               children: [
    //                 Center(
    //                   child: ListView(
    //                     children: [
    //                       ListTile(
    //                         title: Text("Task 1"),
    //                         leading: Icon(Icons.info),
    //                       ),
    //                       ListTile(
    //                         title: Text("Task 2"),
    //                         leading: Icon(Icons.info),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Center(
    //                   child: ListView(
    //                     children: [
    //                       ListTile(
    //                         title: Text("Task 3"),
    //                         leading: Icon(Icons.info),
    //                       ),
    //                       ListTile(
    //                         title: Text("Task 4"),
    //                         leading: Icon(Icons.info),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  
  }
}
