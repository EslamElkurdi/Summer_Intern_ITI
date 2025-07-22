import 'package:flutter/material.dart';
import 'package:iti_flutter/helpers/shared_pref_helper.dart';

class MyAppShared extends StatefulWidget {
  const MyAppShared({super.key, required this.isDark});

  final bool isDark;

  @override
  State<MyAppShared> createState() => _MyAppSharedState();
}

class _MyAppSharedState extends State<MyAppShared> {
  late bool isDark;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDark = widget.isDark;
  }

  Future<void> toggleTheme() async {
    setState(() {
      isDark = !isDark;
    });

    await SharedPreferenceHelper.setBool('isDark', isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Theme",
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text("Shared Pref with Theme")),
        body: Center(
          child: ElevatedButton(
            onPressed: toggleTheme,
            child: Text(
              isDark ? 'switch to light theme' : 'switch to dark theme',
            ),
          ),
        ),
      ),
    );
  }
}
