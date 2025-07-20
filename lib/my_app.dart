import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iti_flutter/person.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> bodyWidgets = [CatDetails(), Bussiness(), School()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Drawer Header")),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(leading: Icon(Icons.info), title: Text('About')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),

            InkWell(
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("This Snackbar!")));
              },
              child: Text("Click On Me"),
            ),
          ],
        ),
      ),
      
      
      appBar: AppBar(title: Text("Json in Flutter")),
      
      
      body: bodyWidgets[_selectedIndex],


      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          _onItemTapped(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
      ),
    );
  }
}

class Bussiness extends StatefulWidget {
  const Bussiness({super.key});

  @override
  State<Bussiness> createState() => _BussinessState();
}

class _BussinessState extends State<Bussiness> {
  var dropdown;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Business Part"),
          SizedBox(height: 50),

          ElevatedButton(
            onPressed: () {
              showAboutDialog(context: context);
            },
            child: Text("show Alert Dialog"),
          ),

          MaterialButton(
            onPressed: null,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            color: Colors.blueGrey,
            child: Text("Press Me"),
          ),

          IconButton(
            onPressed: () {
              log("Clicked");
            },
            icon: Icon(Icons.business),
          ),

          OutlinedButton(
            onPressed: () {
              log("Clicked");
            },
            child: Text('Press Me'),
          ),

          TextButton(
            onPressed: () {
              log("Clicked");
            },
            child: Text('Press Me'),
          ),


          

          DropdownButton<String>(
            value: dropdown,
            items:
                <String>['one', 'Two', 'Three', 'Four'].map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),

            onChanged: (value) {
              setState(() {
                dropdown = value;
              });
            },
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext content) {
    showDialog(
      context: content,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert Dialog Title"),
          content: Text(
            "This is an alert dialog Are you sure you want to proceed?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                log("Cancel");
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),

            TextButton(
              onPressed: () {
                log("Ok");
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}

class School extends StatelessWidget {
  const School({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("School Part"));
  }
}

class CatDetails extends StatelessWidget {
  const CatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LocalService().loadPerson(),

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Person person = snapshot.data as Person;

          return Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(person.image),
                        radius: 50.0,
                      ),

                      SizedBox(height: 10),

                      Text(
                        person.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Age: ${person.age}",
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
