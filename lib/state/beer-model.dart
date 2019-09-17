import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class Beer {
  String title, author;
  int id, karma;
  bool shown = true;
  Beer(this.id, this.title, this.author, this.karma);
}
class BeerModel extends ChangeNotifier {
  List<Beer> _beerList = [
    Beer(1, 'Øl nummer 1', 'Rasmus', 10),
    Beer(2, 'Øl nummer 2', 'Mads', -10),
    Beer(3, 'Øl nummer 3', 'Lauritz', 40),
    Beer(4, 'Øl nummer 4', 'Casper', 0),
  ];
  UnmodifiableListView<Beer> get beerList => UnmodifiableListView<Beer>(_beerList);

  void likeBeer(beer) {
    _beerList.remove(beer);
    notifyListeners();
  }
  void dislikeBeer(beer) {
    _beerList.remove(beer);
    notifyListeners();
  }
  void createBeer() {

    notifyListeners();
  }
  void getMyBeerRanking() {

    notifyListeners();
  }
  void getGlobalBeerRanking() {

    notifyListeners();
  }
}
