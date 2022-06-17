
import 'package:demo_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

void main() {
 
  runApp(MyApp());
   
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}
