import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:iti_flutter/models/product/product.dart';
import 'package:iti_flutter/screens/flutter_day_7.dart';

// http
Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );

  log(response.body);

  if (response.statusCode == 200) {
    List jsonData = jsonDecode(response.body);

    return jsonData.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Faild to load data from API');
  }
}

// Dio
Future<List<Product>> fetchProductsWithDio() async {
  final dio = Dio();

  try {
    final response = await dio.get('https://fakestoreapi.com/products');
    log("Hello");

    // log(response.data['']);

    if (response.statusCode == 200) {
      final data = response.data as List;

      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Invalid Response");
    }
  } catch (error) {
    throw Exception("Something went wrong!");
  }
}


Future<void> login(String username, String password, BuildContext context) async{
  final dio = Dio();

  final credentials = {
    'username' : username,
    'password' : password
  };

  try{
    final response = await dio.post('https://fakestoreapi.com/auth/login', data: credentials);

    if(response.statusCode == 200 && response.data['token'] != null){
      final token = response.data['token'];
      log(token);
      

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }else {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Invalid Email Or Password"),
        content: Text("Ivalid data"),
      ),);
    }
  } catch (error){
    log("Error : $error");
  }
}

// Dio                                           Http
// iterceptors                                   no
// upload                                         no
// timeout                                        no
// headers                                        no