import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const todoApp(),
    );
  }
}

class todoApp extends StatefulWidget {
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  String title = "";
  String des = "";

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (i) {
                      return AlertDialog(
                        title: const Text("나의 할일"),
                        actions: [
                          TextField(
                            decoration: InputDecoration(hintText: "글 제목"),
                            onChanged: (((value) {
                              setState(() {
                                title = value;
                              });
                            })),
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: "글 내용"),
                            onChanged: ((value) {
                              setState(() {
                                des = value;
                              });
                            }),
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    todos.add(Todo(title: title, des: des));
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("추가 하기")),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              title: Text(todos[index].title),
              subtitle: Text(todos[index].des),
            ),
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}

class Todo {
  final String title;
  final String des;

  Todo({required this.title, required this.des});
}
