import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ToastMessage {
  static success(String message) {
    return Get.snackbar('Success', message,
        duration: const Duration(milliseconds: 1000),
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  static error(String message) {
    return Get.snackbar('Alert', message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  static networkError(String message) {
    return Get.snackbar('Network Error', message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  static toastMessage(String message){
    return Fluttertoast.showToast(msg: message, backgroundColor: Colors.black, textColor: Colors.white, fontSize: 14);
  }

  static backPress(String message) {
    return Fluttertoast.showToast(msg: message, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, fontSize: 14);
  }

  static Future<bool> checkconnection() async {
    var connectivityresult;
    try {
      connectivityresult = await InternetAddress.lookup('google.com');
      if (connectivityresult != null) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
