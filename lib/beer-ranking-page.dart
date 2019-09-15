import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';



class BeerRankingPage extends StatefulWidget {
  BeerRankingPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BeerRankingPageState createState() => _BeerRankingPageState();
}

class _BeerRankingPageState extends State<BeerRankingPage> {
  String _value = "All beers";

  List<ChartData> MyBeers = [
    new ChartData("Ostebeer", 14, Colors.lightGreen),
    new ChartData("Svampebeer", 38, Colors.lightGreen),
    new ChartData("God beer", 25, Colors.lightGreen),
    new ChartData("Baconbeer", 43, Colors.lightGreen),
    new ChartData("Druebeer", 19, Colors.lightGreen),
    new ChartData("Vinbeer", 40, Colors.lightGreen),
  ];

  List<ChartData> AllBeers = [
    new ChartData("Saltbeer", 14, Colors.lightGreen),
    new ChartData("Blækbeer", 38, Colors.lightGreen),
    new ChartData("Disko beer", 25, Colors.lightGreen),
    new ChartData("Tinderbeer", 43, Colors.lightGreen),
    new ChartData("Granbeer", 19, Colors.lightGreen),
    new ChartData("Glasbeer", 40, Colors.lightGreen),
    new ChartData("Energierbeer", 43, Colors.lightGreen),
    new ChartData("Grødnbeer", 38, Colors.lightGreen),
    new ChartData("Rødbeer", 17, Colors.lightGreen),
    new ChartData("Mælkebeer", 50, Colors.lightGreen),
    new ChartData("Kobeer", 55, Colors.lightGreen),
    new ChartData("Fiskebeer", 53, Colors.lightGreen),
    new ChartData("Maltbeer", 13, Colors.lightGreen),
    new ChartData("Søbeer", 35, Colors.lightGreen),
    new ChartData("Flod beer", 23, Colors.lightGreen),
    new ChartData("Elefantrbeer", 38, Colors.lightGreen),
    new ChartData("Træbeer", 23, Colors.lightGreen),
    new ChartData("Metalbeer", 26, Colors.lightGreen),
    new ChartData("Flammebeer", 68, Colors.lightGreen),
    new ChartData("Pepsinbeer", 65, Colors.lightGreen),
    new ChartData("Colabeer", 50, Colors.lightGreen),
    new ChartData("Yoghurtkebeer", 52, Colors.lightGreen),
    new ChartData("Blyantbeer", 34, Colors.lightGreen),
    new ChartData("Lammebeer", 13, Colors.lightGreen),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Random rng = new Random();
    List<ChartData> data = [];
    List<ChartData> listdata = [];
    if(_value == "All beers")
    {
      List<ChartData> allBeersSorted = AllBeers;
      allBeersSorted.sort((b, a) => a.votes.compareTo(b.votes));
      listdata = allBeersSorted;
      if(allBeersSorted.length > 5)
      {
        allBeersSorted = allBeersSorted.sublist(0, 5);
      }
      else
      {
        allBeersSorted = allBeersSorted.sublist(0, allBeersSorted.length -1);
      }

      for(int i = 0; i < allBeersSorted.length; i++)
      {
        data.add(allBeersSorted[i]);
      }

      data.sort((a, b) => a.votes.compareTo(b.votes));
    }
    else
      {
        List<ChartData> myBeersSorted = MyBeers;
        listdata = myBeersSorted;
        myBeersSorted.sort((b, a) => a.votes.compareTo(b.votes));
        if(myBeersSorted.length > 5)
        {
          myBeersSorted =  myBeersSorted.sublist(0, 5);
        }
        else
          {
            myBeersSorted = myBeersSorted.sublist(0, myBeersSorted.length -1);
          }

        for(int i = 0; i < myBeersSorted.length; i++)
        {
          data.add(myBeersSorted[i]);
        }

        data.sort((a, b) => a.votes.compareTo(b.votes));
      }



    var series = [
      new charts.Series(
        id: 'Beers',
        domainFn: (ChartData cd, _) => cd.beer,
        measureFn: (ChartData cd, _) => cd.votes,
        colorFn: (ChartData cd, _) => cd.color,
        data: data,

      ),
    ];

    var chart = new charts.BarChart(series, animate: true,
      domainAxis: new charts.OrdinalAxisSpec(),



    );

    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    List<TableRow> trows = new List<TableRow>();

    for(int i = 0; i < listdata.length; i++)
    {
      trows.add(new TableRow(decoration: new BoxDecoration(color: Colors.lightGreen),
        children: [
          TableCell(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 30,
                      child: new Align(
                        child: Text((i+1).toString(), style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center,),
                        alignment: Alignment.center,
                      )

                  )
                ],

              )



          ),
          TableCell(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Container(
                        height: 30,
                        child: new Align(
                          child: Text(listdata[i].beer, style: TextStyle(fontSize: 15, color: Colors.white,), textAlign: TextAlign.center,),
                          alignment: Alignment.center,
                        ))
                  ]
              )),
          TableCell(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Container(
                        height: 30,
                        child: new Align(
                          child: Text(listdata[i].votes.toString(), style: TextStyle(fontSize: 18, color: Colors.white,), textAlign: TextAlign.center, ),
                          alignment: Alignment.center,
                        ))
                  ]
              )),


        ]

      ));
    }




    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the BeerRankingPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Beer Ranking Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Container(
      child: new SingleChildScrollView(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            DropdownButton<String>(
              value: _value,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 3,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
               _value = newValue;
                });
              },
              items: <String>['All beers', 'My beers']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              'Top of ' + _value.toLowerCase(),
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
            ),
            chartWidget,
            Container(
              width: MediaQuery.of(context).size.width * 0.75,

              child: Table(border: TableBorder.all(color: Colors.white),
                children: <TableRow>[
                  TableRow(
                    decoration: new BoxDecoration(color: Colors.lightGreen),
                      children: [
                    TableCell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                                Container(
                                  height: 50,
                                  child: new Align(
                                    child: Text('Rank', style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                    alignment: Alignment.center,
                                  )

                                )
                          ],

                      )



                    ),
      TableCell(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
              Container(
              height: 50,
              child: new Align(
                child: Text('Beer', style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                alignment: Alignment.center,
              ))
              ]
          )),
      TableCell(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
              Container(
              height: 50,
              child: new Align(
                child: Text('Votes', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center, ),
                alignment: Alignment.center,
              ))
              ]
          )),


                ],

              ),
            ] + trows,
              )
            )
              ],

        ),
      ),
              ))
    );
  }
}


class ChartData {
  String beer;
  int votes;
  charts.Color color;

  ChartData(this.beer, this.votes, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
