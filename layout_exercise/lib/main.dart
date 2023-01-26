import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Column 위젯 정렬", home: ColumnExample());
  }
}

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter layout demo"),
      ),
      body: Center(child: Text("Hello World!")),
    );
  }
}
