import 'package:flutter/material.dart';
import 'components/beer-tinder-page/tinder-card.dart';
import 'components/beer-tinder-page/tinder-target-like.dart';
import 'components/beer-tinder-page/tinder-target-dislike.dart';
class _Beer {
  String title, author;
  int id, karma;
  _Beer(this.id, this.title, this.author, this.karma);
}

class BeerTinderPage extends StatefulWidget {
  BeerTinderPage({Key key}) : super(key: key);
  @override
  _BeerTinderPageState createState() => _BeerTinderPageState();
}
class _BeerTinderPageState extends State<BeerTinderPage> {

  List<_Beer> beerList = [
    _Beer(1, 'Øl nummer 1', 'Rasmus', 10),
    _Beer(2, 'Øl nummer 2', 'Mads', -10),
    _Beer(3, 'Øl nummer 3', 'Lauritz', 40),
    _Beer(4, 'Øl nummer 4', 'Casper', 0),
  ];
  List<Widget> getTinderCards() {
    if (beerList.length > 0) {
      List<Widget> tinderCardList = new List();
      beerList.forEach((beer) => tinderCardList.add(
        Center(
            child: TinderCard(beer.id, beer.title, beer.author, beer.karma)
        )
      ));
      return tinderCardList;
    } else {
      return [
        Center(
            child: Text('No more beers!')
        )
      ];
    }
  }

  void like(beerId) {
    setState(() {
      beerList.removeWhere((beer) => beer.id == int.parse(beerId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  child: Container(
                      color: Colors.red,
                      width: 100,
                      child: TinderTargetLike(key: UniqueKey(), like: (beerId) => like(beerId))
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                      color: Colors.red,
                      width: 100,
                      child: TinderTargetDislike(key: UniqueKey(), dislike: (beerId) => like(beerId))
                  )
                ),
                ...getTinderCards()
            ]
        );
  }
}

