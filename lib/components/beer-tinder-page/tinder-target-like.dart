import 'package:flutter/material.dart';

class TinderTargetLike extends StatefulWidget {
  Function(String) like;
  TinderTargetLike({Key key, @required this.like}) : super(key: key);
  @override
  _TinderTargetLikeState createState() => _TinderTargetLikeState();
}

class _TinderTargetLikeState extends State<TinderTargetLike> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        widget.like(data);
      },
      builder: (context, List<String> candidateData, List rejectedData) {
        return Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 5,
          );
      },

    );
  }
}
