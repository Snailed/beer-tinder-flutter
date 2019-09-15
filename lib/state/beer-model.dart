import 'package:provider/provider.dart';

class _Beer {
  String title, author;
  int id, karma;
  _Beer(this.id, this.title, this.author, this.karma);
}
class BeerModel extends ChangeNotifier {
  List<_Beer> get beerList => [
    _Beer(1, 'Øl nummer 1', 'Rasmus', 10),
    _Beer(2, 'Øl nummer 2', 'Mads', -10),
    _Beer(3, 'Øl nummer 3', 'Lauritz', 40),
    _Beer(4, 'Øl nummer 4', 'Casper', 0),
  ];
  void getBeerFeed() {

  }
  void likeBeer() {
    print('LUKSUS!');
  }
  void dislikeBeer() {
    print('STILL PRETTY LUKSUS!');
  }
  void createBeer() {

  }
  void getMyBeerRanking() {

  }
  void getGlobalBeerRanking() {

  }
}
