import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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

List<String> getName() {
  var item = List<String>.generate(1000, (counter) => "Item $counter");
  return item;
}

Widget getList() {
  var data = getName();
  var list = ListView.builder(itemBuilder: (context, index) {
     if(index.isOdd) return Divider(height: 1.0, color: Colors.white,);
    return ListTile(
      title: Text(
        data[index],
        style: TextStyle(color: Colors.white),
      ),
      
    );
  });
  return list;
}
