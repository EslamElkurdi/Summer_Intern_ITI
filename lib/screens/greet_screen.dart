import 'package:flutter/material.dart';

class GreetScreen extends StatelessWidget {
  const GreetScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Greet Screen"),
      ),
      body: Center(
        child: Text("Hello $name"),
      ),
    );
  }
}