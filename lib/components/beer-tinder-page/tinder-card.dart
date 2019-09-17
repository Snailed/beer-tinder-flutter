import 'package:flutter/material.dart';
import '../../state/beer-model.dart';

class TinderCard extends StatelessWidget {
  Beer beer;
  TinderCard(this.beer);

  Widget _getCard() => Container(
    color: Colors.blue,
    width: 100,
    height: 100,
    child: Column(
      children: [
        Text(beer.title),
        Text(beer.author),
        Text(beer.karma.toString())
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: beer,
      child: _getCard(),
      feedback: Material( child:_getCard()), // Material skal åbenbart wrappe kortene
      childWhenDragging: Container(width: 100, height: 100),
    );
  }
}
