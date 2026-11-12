import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// class onboarding extends StatelessWidget {
//   const new({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       body: Column(
//         children: [

//         ],
//       ),
//     );
//   }
// }