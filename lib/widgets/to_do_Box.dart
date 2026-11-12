import 'package:flutter/material.dart';

class ToDoBox extends StatelessWidget {
  final String BoxTitle;
  final bool DoneOrNo;
  final int indexOfItem;
  final Function changeStatus;
  final Function deleteTask;
  
  const ToDoBox({
    super.key,
    required this.BoxTitle,
    required this.DoneOrNo,
    required this.indexOfItem,
    required this.changeStatus,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: GestureDetector(
        onTap: () {
          changeStatus(indexOfItem);
        },
        child: Container(
          width: 333,
          height: 100,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(42, 140, 238, 0.6),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                BoxTitle,
                style: TextStyle(
                  fontSize: 22,
                  color: DoneOrNo? Colors.white :Colors.black,

                  decoration: DoneOrNo
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none,
                ),
              ),

              Row(
                children: [
                  DoneOrNo
                      ? Icon(
                          Icons.check,
                          size: 30,
                          color: const Color.fromARGB(255, 23, 2, 255),
                        )
                      : Icon(Icons.close, size: 30, color: Colors.red),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      deleteTask(indexOfItem);
                    },
                    icon: Icon(Icons.delete, size: 30, color: Colors.red),
                  ),
                ],
              ),

              // Icon(Icons.close, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
