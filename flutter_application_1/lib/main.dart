import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Name Generator",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Name Generator"), // 어플리케이션 이름 설정
          ),
          body: const Center(child: RandomWords()), //
        ));
  }
}

/*
위젯 생성 방법 
1. StatefulWidget을 선언한다.
2. F2를 눌러 자동으로 생성되는 두가지 클래스의 이름을 변경한다. (_클래스명State는 private 클래스로 해당 클래스의 build 함수를 구현한다.)
*/
class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

// RandomWords 클래스의 상태를 정의하는 private 클래스로 build 메소드가 오버라이딩 된다. build 메소드를 통해 해당 클래스가 동작하고자하는 기능을 구현하면 된다.
class _RandomWordsState extends State<RandomWords> {
  /*
  _suggestions 배열을 생성하여 단어를 저장
  _biggerFont 스타일을 선언하여 글자 크기 지정. 확장성을 위해 따로 변수로 관리
  */
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    // ListView 위젯을 활용하여 무작위로 생성된 단어를 전시한다.
    // ListView 위젯에 대해서는 따로 정리를 해봐야할 것 같다.
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
          );
        });
  }
}
