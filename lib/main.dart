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
  var data = <WordPair>[];
  var isFav=<bool>[];
  var i;
  WordPair getName() {
  var item = WordPair.random();
  return item;
}
// void _toggleFavorite() {
//     setState(() {
      
      
//     });
//   }

  Widget getList() {
  
  var list = ListView.builder(itemBuilder: (context, index) {
    if (index.isOdd)
      return Divider(
        height: 1.0,
        color: Colors.white,
      );
    index = index ~/ 2;
    // i=index;
    data.add(getName());
    //print(data);
    isFav.add(false);
    //print(data1);
    //print(i);

    
    return ListTile(
      title: Text(
        data[index].asPascalCase,
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        icon: isFav[index]
            ? Icon(Icons.favorite, color: Colors.white)
            : Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
        onPressed: (){
          print(index);
          setState(() {
           isFav[index]=!isFav[index]; 
          });
        },
      ),
    );
  });
 return list;
}
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



