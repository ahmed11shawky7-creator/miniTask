import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/main.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 89, 99),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                  "assets/img/list.png",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                )
                .animate(
                  onComplete: (controller) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TodoDay()),
                    );
                  },
                )
                .fadeIn(duration: Duration(milliseconds: 1000))
                .fadeOut(delay: 5.seconds, duration: 500.milliseconds),
            Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                )
                .animate(
                  onComplete: (controller) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TodoDay()),
                    );
                  },
                )
                .fadeIn(duration: Duration(milliseconds: 1000))
                .fadeOut(delay: 5.seconds, duration: 500.milliseconds),
          ],
        ),
      ),
    );
  }
}
