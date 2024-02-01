import 'dart:convert';
import 'package:extranet_testapp/helpers/shared_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Network{

  static addEmployee(apiUrl, name, salary, age) async{
    String fullUrl =  IRUDMConstants.baseUrl+apiUrl;
    final Map<String, dynamic> requestData = {
      'name': name,
      'salary': salary,
      'age': age,
    };
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(requestData),
        headers: {
          'Content-type' : 'application/json',
        }
    );
  }

  static getEmployee(apiUrl) async{
    String fullUrl =  IRUDMConstants.baseUrl+apiUrl;
    return await http.get(
        Uri.parse(fullUrl),
        headers: {
          'Content-type' : 'application/json',
        }
    );
  }

  static deleteEmployee(apiUrl, int id) async{
    String fullUrl =  IRUDMConstants.baseUrl+apiUrl+id.toString();
    return await http.delete(
        Uri.parse(fullUrl),
        headers: {
          'Content-type' : 'application/json',
        }
    );
  }

}