import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/tasks_cubit/auth/auth_cubit.dart';
import 'package:iti_flutter/cubit/tasks_cubit/auth/auth_state.dart';
import 'package:iti_flutter/screens/Task/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // navigat to Home Screen

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreenTask()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),

              SizedBox(height: 10),

              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'password'),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed:
                    () => cubit.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ),
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
