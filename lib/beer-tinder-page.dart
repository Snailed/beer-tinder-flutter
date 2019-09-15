import 'package:flutter/material.dart';
import 'components/beer-tinder-page/tinder-card.dart';
import 'components/beer-tinder-page/tinder-target-like.dart';
import 'components/beer-tinder-page/tinder-target-dislike.dart';
import 'package:provider/provider.dart';
import 'state/beer-model.dart';

class BeerTinderPage extends StatefulWidget {
  BeerTinderPage({Key key}) : super(key: key);
  @override
  _BeerTinderPageState createState() => _BeerTinderPageState();
}
class _BeerTinderPageState extends State<BeerTinderPage> {

  List<Widget> getTinderCards(beerList) {
    if (beerList.length > 0) {
      List<Widget> tinderCardList = new List();
      beerList.forEach((beer) => tinderCardList.add(
        Center(
            child: TinderCard(beer)
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
    return Consumer<BeerModel>(
      builder: (context, beerModel, child) {
          return Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  child: Container(
                      color: Colors.red,
                      child: TinderTargetLike(key: UniqueKey(), like: (beer) => beer.like())
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                      color: Colors.red,
                      child: TinderTargetDislike(key: UniqueKey(), dislike: (beer) => beer.dislike())
                  )
                ),
                ...getTinderCards(beerModel.beerList)
            ]
        );
  }
    );
}

