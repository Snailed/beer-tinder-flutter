import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class Beer {
  String title, author, type, description;
  int id, karma;
  Color color;
  bool shown = true;
  Beer(this.id, this.title, this.author, this.karma, this.color, this.type, this.description);
}
class BeerModel extends ChangeNotifier {
  List<Beer> _beerList = [
    Beer(1, 'Hodor Porter', 'Rasmus', 10, Colors.red, 'Porter', 'Heavy porter with a hints of hazelnuts and roast beef'),
    Beer(2, 'I - to the PA', 'Mads', -10, Colors.blue, 'IPA', 'Double IPA with hints of blueberry and old speaker systems'),
    Beer(3, 'Palle is coming for you!', 'Lauritz', 40, Colors.green, 'Pale Ale', 'New-England-style pale ale with cold-fermented barley'),
    Beer(4, 'The taste of GODZILLA', 'Casper', 0, Colors.grey, 'Berliner Weisse', 'Light wheat beer with fruity notes of pineapple and pear'),
    Beer(5, 'Hodor Porter', 'Rasmus', 10, Colors.red, 'Porter', 'Heavy porter with a hints of hazelnuts and roast beef'),
    Beer(6, 'Hodor Porter', 'Rasmus', 10, Colors.red, 'Porter', 'Heavy porter with a hints of hazelnuts and roast beef'),
    Beer(7, 'I - to the PA', 'Mads', -10, Colors.blue, 'IPA', 'Double IPA with hints of blueberry and old speaker systems'),
    Beer(8, 'Palle is coming for you!', 'Lauritz', 40, Colors.green, 'Pale Ale', 'New-England-style pale ale with cold-fermented barley'),
    Beer(9, 'The taste of GODZILLA', 'Casper', 0, Colors.grey, 'Berliner Weisse', 'Light wheat beer with fruity notes of pineapple and pear'),
    Beer(10, 'I - to the PA', 'Mads', -10, Colors.blue, 'IPA', 'Double IPA with hints of blueberry and old speaker systems'),
    Beer(11, 'Palle is coming for you!', 'Lauritz', 40, Colors.green, 'Pale Ale', 'New-England-style pale ale with cold-fermented barley'),
    Beer(12, 'The taste of GODZILLA', 'Casper', 0, Colors.grey, 'Berliner Weisse', 'Light wheat beer with fruity notes of pineapple and pear'),
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
