import 'package:flutter/material.dart';
import 'main.dart';
import 'create-beer-page.dart';
import 'beer-ranking-page.dart';
import 'beer-tinder-page.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
    _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    BeerTinderPage(
      key: PageStorageKey('BeerTinderPage')
    ),
    CreateBeerPage(
      key: PageStorageKey('CreateBeerPage')
    ),
    BeerRankingPage(
      key: PageStorageKey('BeerRankingPage')
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Swipe'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          title: Text('Create'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('Rankings'),
        ),

    ]
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket
      )
    );
  }
}
