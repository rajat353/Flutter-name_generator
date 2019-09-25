import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'main.dart';

class Favorite extends StatefulWidget {
  var itemFav;
  Favorite({Key key, this.itemFav}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavoriteState();
  }
}

class FavoriteState extends State<Favorite> {
  Widget viewFav() {
    return ListView.separated(
      itemCount: itemFav.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            itemFav[index].asPascalCase,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1.0,
          color: Colors.white,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Names',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.black,
      body: viewFav(),
    );
  }
}
