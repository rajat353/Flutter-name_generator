import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'favorite.dart';

var itemFav = <WordPair>[];

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
  var isFav = <bool>[];
  WordPair getName() {
    var item = WordPair.random();
    return item;
  }

  Widget getList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index.isOdd)
        return Divider(
          height: 1.0,
          color: Colors.white,
        );
      index = index ~/ 2;
      data.add(getName());
      isFav.add(false);

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
          onPressed: () {
            setState(() {
              isFav[index] = !isFav[index];
              if (isFav[index] == true) {
                itemFav.add(data[index]);
              } else
                itemFav.remove(data[index]);
            });
          },
        ),
      );
    });
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favorite(itemFav: itemFav)));
                });
              })
        ],
      ),
      body: getList(),
    );
  }
}
