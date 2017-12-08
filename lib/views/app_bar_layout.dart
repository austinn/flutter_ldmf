import 'package:flutter/material.dart';

/**
 * App bar with a transparent background
 * and bold, grey text. May also add a
 * profile and/or settings button
 */
class LDMFAppBar extends StatelessWidget {

  final String title;
  final double appBarHeight = 66.0;

  LDMFAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      color: Colors.transparent,
      height: statusBarHeight + appBarHeight,
      alignment: Alignment.centerLeft,
      margin: new EdgeInsets.only(left: 22.0, top: statusBarHeight  - 10.0),
      child: new Text(
        title,
        style: new TextStyle(
            color: Colors.black54,
            fontFamily: 'REZ',
            fontWeight: FontWeight.w400,
            fontSize: 42.0
        ),
      ),
    );
  }
}