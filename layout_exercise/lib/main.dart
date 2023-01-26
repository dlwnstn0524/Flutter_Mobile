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
      body: SafeArea(
        child: Column(
          /*
          Column의 mainAxisAlignment 요소 정리
          1. MainAxisAlignment.start : 상단부터 차곡차곡 쌓인다.
          2. MainAxisAlignment.center : 가운데로 정렬한다.
          3. MainAxisAlignment.end : 하단부터 차곡차곡 쌓인다.
          4. MainAxisAlignment.spaceAround : 양끝과 위젯간에 간격이 생긴다. 위젯 간격 절반만큼 양끝 여백 
          5. MainAxisAlignment.spaceBetween : 여백없이 정렬이 된다.
          6. MainAxisAlignment.spaceEvenly : 양끝과 위젯간에 간격이 생긴다. 모든 간격 동일
          */
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
