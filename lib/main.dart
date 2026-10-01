import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/counter.dart';
import 'package:flutter_application_1/widgets/to_do_Box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoDay(), debugShowCheckedModeBanner: false);
  }
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

List allTask = [
  Task(title: "call my sister", status: true),
  Task(title: "study", status: false),
  Task(title: "call mom", status: false),
];

// conter
mixin CallFunction {
  int calculateCompletedTask() {
    int completedTask = 0;
    for (var item in allTask) {
      if (item.status) {
        completedTask++;
      }
    }
    return completedTask;
  }
}

class TodoDay extends StatefulWidget {
  TodoDay({super.key});

  @override
  State<TodoDay> createState() => TodoDayState();
}

class TodoDayState extends State<TodoDay> {
  final myController = TextEditingController();
  String? mytask;
  void text() {
    setState(() {
      mytask = myController.text;
    });
  }

  void addNewTask() {
    setState(() {
      allTask.add(Task(title: "$mytask", status: false));
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
          showDialog(
            context: context,
            // backgroundColor: const Color.fromARGB(255, 90, 176, 247),

            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  width: double.infinity,
                  height: 200,
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
                          addNewTask();
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
              Counter(),

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
