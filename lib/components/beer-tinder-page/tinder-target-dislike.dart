
import 'package:flutter/material.dart';

class TinderTargetDislike extends StatefulWidget {
  Function(String) dislike;
  TinderTargetDislike({Key key, @required this.dislike}) : super(key: key);
  @override
  _TinderTargetDislikeState createState() => _TinderTargetDislikeState();
}

class _TinderTargetDislikeState extends State<TinderTargetDislike> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        widget.dislike(data);
      },
      builder: (context, List<String> candidateData, List rejectedData) {
        return Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height,
            width: 50,
          );
      },

    );
  }
}
