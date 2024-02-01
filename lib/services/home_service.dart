import 'dart:convert';

import 'package:extranet_testapp/helpers/api.dart';
import 'package:extranet_testapp/helpers/shared_data.dart';
import 'package:extranet_testapp/models/add_user_data.dart';
import 'package:extranet_testapp/models/employee_data.dart';
import 'package:extranet_testapp/utils/toast_message.dart';
import 'package:extranet_testapp/widgets/ConfirmationDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeService extends GetConnect {

  late AddUserData resp;

  List<UserData> userList = [];

  Future<AddUserData> addUser(String name, String? salary, String? age, BuildContext context) async {
    try {
      var response = await Network.addEmployee('api/v1/create',name,salary,age);
      var listdata = json.decode(response.body);
      if(listdata['status'] == "success"){
        resp = AddUserData.fromJson(listdata);
        return resp;
      }
      else{
        //IRUDMConstants.showInSnackBar(context, 'Something Unexpected happened! Please try again.');
        return resp;
      }
    } catch (err) {
      ToastMessage.error("Failed! Please try again!!");
    }
    return resp;
  }

  Future<List<UserData>> getUsers() async {
    try {
      var response = await Network.getEmployee('api/v1/employees');
      var listdata = json.decode(response.body);
      if(listdata['status'] == "success"){
        if(listdata['data'] != null){
          var listJson = listdata['data'];
          userList = listJson.map<UserData>((val) => UserData.fromJson(val)).toList();
          return userList;
        }
      }
      else{
        //IRUDMConstants.showInSnackBar(context, 'Something Unexpected happened! Please try again.');
        return userList;
      }
    } catch (err) {
      print("Error " + err.toString());
    }
    return userList;
  }


  Future<void> deleteUser(int? id, BuildContext context) async {
    try {
      var response = await Network.deleteEmployee('api/v1/delete/', id!);
      var listdata = json.decode(response.body);
      if(listdata['status'] == "success"){
        if(listdata['data'] != null){
          ToastMessage.success("${listdata['message'].toString()}, Data was: ${listdata['data'].toString()}");
        }
      }
      else{
        ToastMessage.error("Data not deleted!!");
      }
    } catch (err) {
      ToastMessage.error("Data not deleted!!");
    }
  }


}