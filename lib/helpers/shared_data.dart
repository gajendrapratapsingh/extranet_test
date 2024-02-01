
import 'package:flutter/material.dart';

class IRUDMConstants {

  static const String baseUrl = "https://dummy.restapiexample.com/";

  static void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(value),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.redAccent[100]),
    );
  }

}