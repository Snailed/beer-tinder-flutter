import 'package:flutter/material.dart';
import '../../state/beer-model.dart';

class TinderTargetDislike extends StatefulWidget {
  Function(Beer) dislike;
  TinderTargetDislike({Key key, @required this.dislike}) : super(key: key);
  @override
  _TinderTargetDislikeState createState() => _TinderTargetDislikeState();
}

class _TinderTargetDislikeState extends State<TinderTargetDislike> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<Beer>(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        widget.dislike(data);
      },
      builder: (context, List<Beer> candidateData, List rejectedData) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 3,
          );
      },

    );
  }
}
