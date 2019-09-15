import 'package:flutter/material.dart';

class TinderCard extends StatelessWidget {
  String title, author;
  int id, karma;
  TinderCard(this.id, this.title, this.author, this.karma);
  Widget _getCard() => Container(
    color: Colors.blue,
    width: 100,
    height: 100,
    child: Column(
      children: [
        Text(title),
        Text(author),
        Text(karma.toString())
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: id.toString(),
      child: _getCard(),
      feedback: Material( child:_getCard()), // Material skal åbenbart wrappe kortene
      childWhenDragging: Container(width: 100, height: 100),
    );
  }
}
