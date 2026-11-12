import 'package:flutter/material.dart';


class Counter extends StatelessWidget  {

  final int alltodos;
  final int allComplet ;
  
 const Counter({super.key, required this.alltodos  , required this.allComplet });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "$allComplet/$alltodos",
        style: TextStyle(
          color: alltodos ==allComplet ? Colors.blue : Colors.white,
          fontSize: 25 , fontWeight: FontWeight.bold),
      ),
    );
  }
}
