import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import '../../state/beer-model.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String beerLocation = 'assets/beer.svg';
class TinderCard extends StatelessWidget {
  Beer beer;
  TinderCard(this.beer);

  Widget _getCard() => Container(
    decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color.fromARGB(8,0,0,0),
          offset: Offset(2,2),
          blurRadius: 10,
        )],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
    width: 250,
    height: 350,
    child: Padding(
        padding: EdgeInsets.only(left:20, right: 20, bottom: 20),
        child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 30),
            child:  SvgPicture.asset(
              beerLocation,
              height: 150,
              width: 100,
              color: beer.color
            )
          ),
          Text(beer.title, style: TextStyle(fontFamily: 'Mikkelwind', fontSize: 32.0, height: 0.8), textAlign: TextAlign.center),
          Text(beer.description, textAlign:TextAlign.center)
        ]
      )
    )
        );

  @override
  Widget build(BuildContext context) {
    return Draggable(
      axis: Axis.horizontal,
      data: beer,
      child: _getCard(),
      feedback: Material( child:_getCard()), // Material skal åbenbart wrappe kortene
      childWhenDragging: Container(width: 100, height: 100),
    );
  }
}
