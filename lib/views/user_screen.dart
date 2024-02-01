import 'package:extranet_testapp/controllers/user_controller.dart';
import 'package:extranet_testapp/services/home_service.dart';
import 'package:extranet_testapp/widgets/ConfirmationDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {

  final userController = Get.put<UserController>(UserController());

  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: const Text("Employee", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.zero,
        child: Obx(() => userController.userState.value == UserState.idle ||  userController.userState.value == UserState.loading ? const Center(child: CircularProgressIndicator()) : ListView.builder(itemCount: userController.employees.length,
            shrinkWrap: true,
            controller: listScrollController,
            padding: EdgeInsets.zero,itemBuilder: (BuildContext context, int index)
            {
              return Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(
                      color: Colors.blue.shade500,
                      width: 1.0,
                    )),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Column(children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Employee Name", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 2.0),
                                          Text(userController.employees[index].employeeName.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Employee Age", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 2.0),
                                          Text(userController.employees[index].employeeAge.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Employee Salary", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 2.0),
                                          Text(userController.employees[index].employeeSalary.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)),
                                        ],
                                      )),
                                      IconButton(onPressed: () async{
                                        _showConfirmationDialog(context, userController.employees[index].id!);
                                      }, icon: const Icon(Icons.delete)),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ]))
                    ],
                  ),
                ),
              );

            })),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(id);
      },
    );
  }
}
