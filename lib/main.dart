

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/to_do_Box.dart';

// import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: todo_day(), debugShowCheckedModeBanner: false);
  }
}

class task {
  String title;
  bool status;

  task({required this.title, required this.status});
}


class todo_day extends StatefulWidget {
  todo_day({super.key});

  @override
  State<todo_day> createState() => _todo_dayState();
}

class _todo_dayState extends State<todo_day> {


List allTask = [
  task(title: "call my sister", status: true),
  task(title: "study", status: true),
  task(title: "sleep", status: false),
];



final myController = TextEditingController();
String? mytask ;
void text (){
  setState(() {
    mytask = myController.text;
  });
}


void AddNewTask() {
  setState(() {
     allTask.add(task(title: "$mytask" , status: true));
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(83, 167, 251, 0.49),
      appBar: AppBar(
        title: Text(
          "To Do Day",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(42, 140, 238, 0.6),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: const Color.fromARGB(255, 90, 176, 247),

            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 35),
                      // padding: EdgeInsets.all(),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(

                        controller: myController,

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          // border: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: 'Enter the task',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                          labelText: "task",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),

                          prefixIcon: Icon(Icons.task),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        text();
                        AddNewTask();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 35,
                        ),
                      ),
                      child: Text(
                        "add task",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 3, 79, 130),
        child: Icon(Icons.add, size: 35, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ...allTask.map(
                (item) => ToDoBox(BoxTitle: item.title, DoneOrNo: item.status),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
