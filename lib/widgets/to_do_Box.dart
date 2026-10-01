import 'package:flutter/material.dart';

class ToDoBox extends StatelessWidget {
  String BoxTitle;
  bool DoneOrNo;
  ToDoBox({super.key, required this.BoxTitle, required this.DoneOrNo});
  
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        width: 333,
        height: 100,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(42, 140, 238, 0.6),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(BoxTitle, style: TextStyle(fontSize: 22, color: Colors.black)),

            DoneOrNo
                ? Icon(
                    Icons.check,
                    size: 30,
                    color: const Color.fromARGB(255, 23, 2, 255),
                  )
                : Icon(Icons.close, size: 30, color: Colors.red),

            // Icon(Icons.close, size: 30),
          ],
        ),
      ),
    );
  }
}
