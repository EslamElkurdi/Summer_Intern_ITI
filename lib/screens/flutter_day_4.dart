import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iti_flutter/screens/flutter_day_3.dart';

enum Gender {
  male("Male"),
  female("Female"),
  others("Others");

  final String text;

  const Gender(this.text);
}

class MyForm extends StatefulWidget {
  MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  var isSecure = true;

  var options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  var selectedOption = <String>[];

  Gender? _selectedOption = Gender.male;

  var settings = <String, bool>{
    "Wifi": true,
    "Bluetooth": false,
    "Airplane Mode": false,
    "Mobile Data": true,
  };

  DateTime? selectedDateTime;

  Future<void> _selectedDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            picked.hour,
            picked.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle changes to the text field
                  log("Name changed: $value");
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle changes to the text field
                  log("Email changed: $value");
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Simple regex for email validation
                  // final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  // if (!emailRegex.hasMatch(value)) {
                  //   return 'Please enter a valid email address';
                  // }
                  return null; // Return null if the input is valid
                },
              ),
              SizedBox(height: 20),
              // password field
              TextFormField(
                obscureText: isSecure,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon:
                      isSecure
                          ? IconButton(
                            onPressed: () {
                              // Toggle password visibility
                              log("Toggle password visibility");
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          )
                          : IconButton(
                            onPressed: () {
                              // Toggle password visibility
                              log("Toggle password visibility");
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Icon(Icons.visibility_off),
                          ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null; // Return null if the input is valid
                },
              ),

              // Checkbox
              // Expanded(
              //   child: ListView(
              //     children:
              //         options.map((String option) {
              //           return CheckboxListTile(
              //             title: Text("Accept Terms and Conditions"),
              //             value: selectedOption.contains(option),
              //             onChanged: (value) {
              //               // Handle checkbox state change
              //               log("Checkbox changed: $value");
              //               setState(() {
              //                 if (value == true) {
              //                   selectedOption.add(option);
              //                 } else {
              //                   selectedOption.remove(option);
              //                 }
              //               });
              //             },
              //           );
              //         }).toList(),
              //   ),
              // ),

              // Radio Buttons
              // Column(
              //   children:
              //       Gender.values.map((option) {
              //         return RadioListTile<Gender>(
              //           title: Text(option.text),
              //           value: option,
              //           groupValue: _selectedOption,
              //           onChanged: (value) {
              //             setState(() {
              //               _selectedOption = value;
              //             });
              //           },
              //         );
              //       }).toList(),
              // ),

              // switch
              // Expanded(
              //   child: ListView(
              //     children:
              //         settings.keys.map((String key) {
              //           return SwitchListTile(
              //             title: Text(key),
              //             value: settings[key]!,
              //             onChanged: (bool value) {
              //               setState(() {
              //                 settings[key] = value;
              //                 log("$key is now ${value ? 'ON' : 'OFF'}");
              //               });
              //             },
              //           );
              //         }).toList(),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  // with navigator
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AssetsSection()),
                  // );

                  // using named Routes
                  Navigator.pushNamed(context, '/asset_section');
                },
                child: Text("Go"),
              ),
              // Date Picker
              MaterialButton(
                onPressed: () {
                  _selectedDateTime(context);
                },
                child: Text("Pick Date"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //false
                    log("Form is valid");
                    // You can process the data here, e.g., send it to a server
                    log("Name: ${_nameController.text}");
                    log("Email: ${_emailController.text}");
                    log(
                      "Password: ${_emailController.text}",
                    ); // Note: Don't log passwords in production
                  } else {
                    log("Form is invalid");
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
