import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splash.dart';
import 'package:flutter_application_1/widgets/counter.dart';
import 'package:flutter_application_1/widgets/to_do_Box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class TodoDay extends StatefulWidget {
  const TodoDay({super.key});

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

  List allTask = [
    Task(title: "call my sister", status: true),
    Task(title: "study", status: false),
    Task(title: "call mom", status: false),
  ];

  // conter

  int calculateCompletedTask() {
    int completedTask = 0;
    for (var item in allTask) {
      if (item.status) {
        completedTask++;
      }
    }
    return completedTask;
  }

  void changeStatus(int TaskIndex) {
    setState(() {
      allTask[TaskIndex].status = !allTask[TaskIndex].status;
    });
  }

  void deletTask(int taskIndex) {
    setState(() {
      allTask.remove(allTask[taskIndex]);
    });
  }

  void deleteAllTasks() {
    setState(() {
      allTask.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 132, 193, 243),
     
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
        actions: [
          IconButton(
            onPressed: () {
              deleteAllTasks();
            },
            icon: Icon(
              Icons.delete_forever,
              size: 30,
              color: const Color.fromARGB(255, 11, 3, 255),
            ),
          ),
        ],
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
                        margin: EdgeInsets.fromLTRB(10, 30, 10, 25),

                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: myController,
                          maxLength: 20,

                          decoration: InputDecoration(
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
                            vertical: 15,
                            horizontal: 30,
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
      body: Column(
        children: [
          Counter(
            alltodos: allTask.length,
            allComplet: calculateCompletedTask(),
          ),
          allTask.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    "Please add the new task ",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                )
              : Container(
                  height: 600,
                 color: const Color. fromRGBO(83, 167, 251, 0.49),
                  child: ListView.builder(
                    itemCount: allTask.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoBox(
                        BoxTitle: allTask[index].title,
                        DoneOrNo: allTask[index].status,
                        indexOfItem: index,
                        changeStatus: changeStatus,
                        deleteTask: deletTask,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
