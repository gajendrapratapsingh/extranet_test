import 'dart:async';

import 'package:extranet_testapp/models/add_user_data.dart';
import 'package:extranet_testapp/services/home_service.dart';
import 'package:extranet_testapp/utils/routes/routes.dart';
import 'package:extranet_testapp/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeState {idle, loading, success, failed, failedWithError }
class HomeController extends GetxController{

  var homeState = HomeState.idle.obs;

  final _checkValue = false.obs;
  bool get checkValue => _checkValue.value;
  set checkValue(bool value) => _checkValue.value = value;

  final _isVisible = false.obs;
  bool get isVisible => _isVisible.value;
  set isVisible(bool value) => _isVisible.value = value;


  final _error = ''.obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  @override
  void onInit(){
    //change([], status: RxStatus.empty());
    super.onInit();
  }

  @override
  void onReady(){
    //change([], status: RxStatus.empty());
    super.onReady();
  }

  @override
  void onClose(){
    //Get called when controller is removed from memory
    super.onClose();
  }


  Future<void> addUsers(String name, String salary, String age, BuildContext context) async {
    try {
      error = '';
      homeState.value = HomeState.loading;
      AddUserData addUserResponse = await HomeService().addUser(name, salary, age, context);
      print("addOperation response: $addUserResponse");
      if(addUserResponse.status == "success" && addUserResponse.message == "Successfully! Record has been added."){
        ToastMessage.success(addUserResponse.message!);
        homeState.value = HomeState.success;
        Timer(const Duration(milliseconds: 1000), () {
          Get.toNamed(Routes.userScreen);
        });
      }
      else{
        error = 'failed. Please try again.';
        homeState.value = HomeState.failed;
        ToastMessage.error(error);
        Timer(const Duration(seconds: 2), () {
          homeState.value = HomeState.idle;
        });
      }
    } catch (e) {
      error = 'failed. Please try again.';
      homeState.value = HomeState.failedWithError;
      ToastMessage.error(error);
      Timer(const Duration(seconds: 2), () {
        homeState.value = HomeState.idle;
      });
    }
  }

}
