import 'package:extranet_testapp/utils/routes/pages.dart';
import 'package:extranet_testapp/utils/routes/routes.dart';
import 'package:extranet_testapp/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Extranet Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: Pages.list,
      initialRoute: Routes.homeScreen,
    );
  }
}