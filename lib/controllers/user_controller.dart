import 'dart:async';

import 'package:extranet_testapp/models/employee_data.dart';
import 'package:extranet_testapp/services/home_service.dart';
import 'package:extranet_testapp/utils/routes/routes.dart';
import 'package:extranet_testapp/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserState {idle, loading, success, failed, failedWithError }
class  UserController extends GetxController{

  var userState = UserState.idle.obs;

  final _error = ''.obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  final List<UserData> employees = <UserData>[];

  void setEmployees(List<UserData> jsonList) {
    employees.assignAll(jsonList);
  }

  @override
  void onInit(){
    getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    try {
      error = '';
      userState.value = UserState.loading;
      var usersResp = await HomeService().getUsers();
      print("userOperation response: $usersResp");
      if(usersResp.isNotEmpty){
        setEmployees(usersResp);
        userState.value = UserState.success;
      }
      else{
        error = 'failed. Please try again.';
        userState.value = UserState.failed;
        ToastMessage.error(error);
        Timer(const Duration(seconds: 2), () {
          userState.value = UserState.idle;
        });
      }
    } catch (e) {
      error = 'failed. Please try again.';
      userState.value = UserState.failedWithError;
      ToastMessage.error(error);
      Timer(const Duration(seconds: 2), () {
        userState.value = UserState.idle;
      });
    }
  }
}