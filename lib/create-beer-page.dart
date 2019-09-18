import 'package:flutter/material.dart';

class CreateBeerPage extends StatefulWidget {
  CreateBeerPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CreateBeerPageState createState() => _CreateBeerPageState();
}

class _CreateBeerPageState extends State<CreateBeerPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  String beer_type = 'IPA';
  double slider_val = 5;
  var list_tekst = ["Start med at vælge din øl-type","Hvor stærk skal øllen være?"];
  var list_widgets;
  var index = 0;

  final ListCon = new ScrollController();
  final nameCon = TextEditingController();

  bool bygVal = false;
  bool rugVal = false;
  bool hvedeVal = false;


  void addComponent(callId) {
    if(callId==index) {
      _listKey.currentState.insertItem(index+1, duration: Duration(milliseconds: 1000));
      _listKey.currentState.widget.controller.animateTo(_listKey.currentState.widget.controller.position.maxScrollExtent+100, duration: Duration(milliseconds: 800), curve: Curves.easeIn); //Temporary auto- scroll fix
      index++;
    }

  }



  Widget _buildItem([int index]) {
    return list_widgets[index];
  }

  @override
  Widget build(BuildContext context) {
    list_widgets = [
      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              "Lad os starte med at vælge en øl-type",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            DropdownButton<String>(
              value: beer_type,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  beer_type = newValue;
                });
                addComponent(0);
              },
              items: <String>['IPA', 'Pilsner', 'Brown Ale', 'Lager']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              "Godt valg! Hvor stærk skal din øl være?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              slider_val.round().toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1,
            ),

            Slider(
              value: slider_val,
              onChanged: (newRating) {
                setState(() => slider_val = newRating);
              },
              onChangeEnd: (event){
                addComponent(1);
              },
              min: 0,
              max: 10,
              divisions: 10,
            ),

          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              "Hvad skal øllen være lavet på?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // [Monday] checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Byg"),
                    Checkbox(
                      value: bygVal,
                      onChanged: (bool value) {
                        setState(() {
                          bygVal = value;
                          addComponent(2);
                        });
                      },
                    ),
                  ],
                ),
                // [Tuesday] checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Rug"),
                    Checkbox(
                      value: rugVal,
                      onChanged: (bool value) {
                        setState(() {
                          rugVal = value;
                          addComponent(2);
                        });
                      },
                    ),
                  ],
                ),
                // [Wednesday] checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Hvede"),
                    Checkbox(
                      value: hvedeVal,
                      onChanged: (bool value) {
                        setState(() {
                          hvedeVal = value;
                          addComponent(2);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60), Text(
              "Hvad skal mesterværket hedde?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            TextField(
              controller: nameCon,
              decoration: InputDecoration(labelText: 'Navn'),
              onSubmitted: (event){
                setState(() {});
                addComponent(3);
              },
            ),
          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60), Text(
              "Beskriv smagen af "+nameCon.text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Beskrivelse'),

              onChanged: (event){
                addComponent(4);
              },
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            FlatButton(
                color: Colors.green,
                onPressed: (){

                },
                child: Text(
                  "Opret",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
            )
          ],
        ),
      ),
    ];


    return SafeArea(
        child: AnimatedList(
          controller: ListCon,
          key: _listKey,
          initialItemCount: 1,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            return FadeTransition(
              opacity: animation,
              child: _buildItem(index),
            );
          },
        ),
      );
  }
}
