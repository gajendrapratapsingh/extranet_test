import 'package:extranet_testapp/controllers/home_controller.dart';
import 'package:extranet_testapp/controllers/network_controller.dart';
import 'package:extranet_testapp/utils/routes/routes.dart';
import 'package:extranet_testapp/utils/strings.dart';
import 'package:extranet_testapp/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  final _usernameController = TextEditingController();
  final _salaryController = TextEditingController();
  final _ageController = TextEditingController();

  final networkController = Get.put<NetworkController>(NetworkController());
  final controller = Get.put<HomeController>(HomeController());
  var username, salary, age;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        floatingActionButton: FloatingActionButton(onPressed: (){
          Get.toNamed(Routes.userScreen);
        },  backgroundColor: Colors.deepPurple, child: const Icon(Icons.menu, color: Colors.white)),
        body: Column(
          children: [
            Expanded(child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: const BorderSide(color: Colors.indigo, width: 1.5)),
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                key: _formKey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(width: Get.width / 4, height: Get.width / 4, 'assets/images/user.png'),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                        labelText: Strings.username.tr,
                                        labelStyle: const TextStyle(fontSize: 15),
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.indigo, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        focusColor: Colors.red[300],
                                      ),
                                      validator: ValidationBuilder().required("Field can't be empty").maxLength(30).build(),
                                      onSaved: (val) {
                                        username = val;
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _salaryController,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                        labelText: Strings.slary.tr,
                                        labelStyle: const TextStyle(fontSize: 15),
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.indigo, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        focusColor: Colors.red[300],
                                      ),
                                      validator: ValidationBuilder().minLength(5).maxLength(10).build(),
                                      onSaved: (val) {
                                        salary = val;
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _ageController,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                        labelText: Strings.age.tr,
                                        labelStyle: const TextStyle(fontSize: 15),
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.indigo, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        focusColor: Colors.red[300],
                                      ),
                                      validator: ValidationBuilder().minLength(1).maxLength(3).build(),
                                      onSaved: (val) {
                                        age = val;
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    Obx((){
                                      if(controller.homeState.value == HomeState.idle){
                                        return ElevatedButton(
                                            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, minimumSize: const Size.fromHeight(45),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                                textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                            onPressed: () {
                                              if(networkController.connectionStatus.value != 0){
                                                if(_formKey.currentState!.validate()){
                                                  controller.addUsers(_usernameController.text.trim(), _salaryController.text.trim(), _ageController.text.trim(), context);
                                                }
                                              }
                                              else{
                                                ToastMessage.networkError(Strings.plcheckconn.tr);
                                              }
                                            },
                                            child: Text(Strings.submitbtn.tr, style: const TextStyle(color: Colors.white, fontSize: 18.0)));
                                      }
                                      else if(controller.homeState.value == HomeState.loading){
                                        return Container(height: 55, width: 55, decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(27.5)), alignment: Alignment.center, child: const SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.0)));
                                      }
                                      else if(controller.homeState.value == HomeState.success){
                                        return Container(height: 55, width: 55, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(27.5)), child: const Icon(color: Colors.white, Icons.done_rounded, size: 30.0));
                                      }
                                      else if(controller.homeState.value == HomeState.failedWithError || controller.homeState.value == HomeState.failed){
                                        return Container(height: 55, width: 55, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(27.5)), child: const Icon(color: Colors.white, Icons.clear, size: 30.0));
                                      }
                                      return ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, minimumSize: const Size.fromHeight(45),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                              textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            if(networkController.connectionStatus.value != 0){
                                              if(_formKey.currentState!.validate()){
                                                controller.addUsers(_usernameController.text.trim(), _salaryController.text.trim(), _ageController.text.trim(), context);
                                              }
                                            }
                                            else{
                                              ToastMessage.networkError(Strings.plcheckconn.tr);
                                            }
                                          },
                                          child: Text(Strings.submitbtn.tr, style: const TextStyle(color: Colors.white, fontSize: 18.0)));
                                    }),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        )
    );
  }
}
