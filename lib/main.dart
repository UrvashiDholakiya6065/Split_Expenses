import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitexpenses_app/Screens/Bottom_Navigation/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: BottomNavigation()
    );
  }
}
