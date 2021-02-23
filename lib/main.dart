import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:quiz_app/screens/quiz/quiz_screen.dart';
// import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const kPrimaryGradient = LinearGradient(
    //   colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    //   begin: Alignment.centerLeft,
    //   end: Alignment.centerRight,
    // );
    // print(kPrimaryGradient);
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
