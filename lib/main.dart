import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_flutter/flutter_day_3.dart';
import 'package:iti_flutter/flutter_day_6.dart';
import 'package:iti_flutter/helpers/db_helper.dart';
import 'package:iti_flutter/helpers/shared_pref_helper.dart';
import 'package:iti_flutter/home_screen.dart';
import 'package:iti_flutter/style/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceHelper.init();

  final bool? isDark = await SharedPreferenceHelper.getBool('isDark');

  // runApp(MyAppShared(isDark: isDark ?? false));

  runApp(MySVG());
}

class MySVG extends StatelessWidget {
  const MySVG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text("SVG"),
        ),
        body: Center(
          child: SvgPicture.asset(
            'assets/images/svg/imagesvg.svg',
            width: 300,
            height: 399,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SQLite Todo App', home: TaskScreen());
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final DBHelper dbHelper = DBHelper();

  List<Map<String, dynamic>> tasks = [];

  final TextEditingController _controller = TextEditingController();

  // load tasks
  void _loadTasks() async {
    final data = await dbHelper.getTasks();

    setState(() {
      tasks = data;
    });
  }

  // add task
  void _addTask(String title) async {
    await dbHelper.insertTask(title);
    _controller.clear();
    _loadTasks();
  }

  // update task
  void _toggleTask(int id, int isDone) async {
    await dbHelper.updateTask(id, isDone == 0 ? 1 : 0);
    _loadTasks();
  }

  // deleteTask
  void _deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    _loadTasks();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Todo List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter Task'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addTask(_controller.text);
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children:
                  tasks.map((task) {
                    return ListTile(
                      title: Text(
                        task['title'],
                        style: TextStyle(
                          decoration:
                              task['isDone'] == 1
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: task['isDone'] == 1,
                        onChanged: (value) {
                          _toggleTask(task['id'], task['isDone']);
                        },
                      ),

                      trailing: IconButton(
                        onPressed: () => _deleteTask(task['id']),
                        icon: Icon(Icons.delete),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}








  // runApp(MaterialApp(
  //   routes: {
  //     '/asset_section' : (context) => AssetsSection()  
  //   },
  //   debugShowCheckedModeBanner: false,
  //   home: HomeScreen()));

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
