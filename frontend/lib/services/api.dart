// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.0.115:8080/api/";

  // Method to add user
  static Future<void> addUserModel(Map<String, String> pdata) async {
    var url = Uri.parse(baseUrl + "add_user");

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to add user: ${res.statusCode}, ${res.body}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Method to fetch users
  static Future<List<dynamic>> fetchUsers() async {
    var url = Uri.parse(baseUrl + "getusers");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Return the list of users
      } else {
        print('Failed to fetch users: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching users: $error');
      return [];
    }
  }

  //Method to update user
  static Future<void> updateUser(String id, Map<String,String>pdata) async{
    var url = Uri.parse(baseUrl + "update_user/$id");

    try{
        final res = await http.put(url, body: pdata);

        if(res.statusCode == 200){
          print('User Updated Successfuly: ${res.body}');
        }
        else{
          print('Failed to update user: ${res.statusCode},${res.body}');
        }
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  static Future<void> deleteUser (String id) async{
    final response = await http.delete(
      Uri.parse('$baseUrl/delete/$id')
    );
     if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
  

}
