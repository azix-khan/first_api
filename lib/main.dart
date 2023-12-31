// import 'package:api_demo/example_five.dart';
// import 'package:api_demo/signUp_screen.dart';
import 'package:api_demo/upload_image.dart';
// import 'package:api_demo/example_four.dart';
// import 'package:api_demo/example_three.dart';
// import 'package:api_demo/example_two.dart';
// import 'package:api_demo/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UploadImageScreen(),
    );
  }
}
