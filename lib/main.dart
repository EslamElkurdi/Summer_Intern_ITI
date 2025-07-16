import 'package:flutter/material.dart';
import 'package:iti_flutter/flutter_day_3.dart';
import 'package:iti_flutter/flutter_day_4.dart';
import 'package:iti_flutter/home_screen.dart';
import 'package:iti_flutter/my_app.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/asset_section' : (context) => AssetsSection()  
    },
    debugShowCheckedModeBanner: false,
    home: HomeScreen()));
}

// class ToDo extends StatelessWidget {
//   ToDo({super.key});

//   final List<String> tasks = ['Go to Gym', 'Go to College', 'Go to Office'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue, title: Text("To-DO App")),
//       body: ListView.builder(
//         itemCount: tasks.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               tasks[index],
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               "Go to Gym at 6:00 AM",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   int _counter = 0;

//   // increment
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Counter App")),

//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("$_counter", style: TextStyle(fontSize: 30)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 FloatingActionButton(
//                   onPressed: _incrementCounter,
//                   tooltip: 'Add',
//                   child: Icon(Icons.add),
//                 ),

//                 FloatingActionButton(
//                   onPressed: _decrementCounter,
//                   tooltip: "Subtract",
//                   child: Icon(Icons.remove),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
