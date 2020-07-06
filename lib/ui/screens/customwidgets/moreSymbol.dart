import 'package:flutter/material.dart';


class MoreSymbol extends StatelessWidget {
  final double width;
  MoreSymbol({this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: width,
            color: Colors.black,
          ),
          Container(
            width: width/2,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}