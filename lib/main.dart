import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: NameGenerator()));
}

class NameGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NameGeneratorState();
  }
}

class NameGeneratorState extends State<NameGenerator> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Name Generator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: getList(),
    );
  }
}

WordPair getName() {
  var item = WordPair.random();
  return item;
}

Widget getList() {
  final data = <WordPair>[];
  var list = ListView.builder(itemBuilder: (context, index) {
    if (index.isOdd)
      return Divider(
        height: 1.0,
        color: Colors.white,
      );
    index = index ~/ 2;
    data.add(getName());
    return ListTile(
      title: Text(
        data[index].asPascalCase,
        style: TextStyle(color: Colors.white),
      ),
    );
  });
  return list;
}
