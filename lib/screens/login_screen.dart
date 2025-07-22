import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/screens/flutter_day_7.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  //String username, String password, BuildContext context
  Future<void> login() async {
    final dio = Dio();

    setState(() {
      isLoading = true;
    });

    log("User ${usernameController.text.trim()}");
    log("Password ${passwordController.text.trim()}");

    final credentials = {
      'username': usernameController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      final response = await dio.post(
        'https://fakestoreapi.com/auth/login',
        data: credentials,
      );

      if (response.statusCode == 200 && response.data['token'] != null) {
        final token = response.data['token'];
        log(token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("Invalid Email Or Password"),
                content: Text("Ivalid data"),
              ),
        );
      }
    } catch (error) {
      log("Error : $error");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),

            SizedBox(height: 10),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),

            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(onPressed: login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
