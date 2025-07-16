import 'dart:convert';

import 'package:flutter/services.dart';

class Person {
  final String name;
  final String address;
  final int age;
  final String image;
  final String description;

  // constructor
  Person({
    required this.name,
    required this.address,
    required this.age,
    required this.description,
    required this.image,
  });

  // convert json to person object
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      address: json['address'],
      age: json['age'],
      image: json['image'],
      description: json['description'],
    );
  }
}

class LocalService {

  // Load and decode the json File
  Future<String> _loadPersonAsset() async {
    return await rootBundle.loadString('assets/data/info.json');
  }

  // Load decode json file
  Future<Person> loadPerson() async {

    String jsonString = await _loadPersonAsset();

    final jsonResponse = json.decode(jsonString);

    return Person.fromJson(jsonResponse);
  }
}



