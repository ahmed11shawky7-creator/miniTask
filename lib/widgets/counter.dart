import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _ToDoBoxState();
}

class _ToDoBoxState extends State<Counter> with CallFunction {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "${calculateCompletedTask()}/${allTask.length}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
