import 'package:flutter/material.dart';
import 'package:flutter_ldmf/models/dance.dart';

class DanceItem extends StatelessWidget {

  final Dance dance;

  DanceItem(this.dance);

  @override
  Widget build(BuildContext context) {
    final danceThumbnail = new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.symmetric(horizontal: 12.0),
      child: new FloatingActionButton(
          onPressed: null
      ),
    );

    final danceContent = new Expanded(
      child: new Container(
        margin: new EdgeInsets.only(left: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                  dance.name,
                  style: new TextStyle(
                      color: new Color(0xFA5C727C),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0
                  )
              ),
            ),
            new Container(
                margin: new EdgeInsets.only(top: 4.0),
                child: new Text(
                  dance.choreographer,
                  style: new TextStyle(
                      color: new Color(0xFFBECDD5),
                      fontWeight: FontWeight.w500,
//                      fontStyle: FontStyle.italic
                  ),
                )
            ),
          ],
        ),
      ),
    );

    final danceDetailContent = new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              dance.level,
              style: new TextStyle(
                color: new Color(0xFABECDD5),
                fontFamily: 'Lato'
              ),
            ),
          )
        ],
      ),
    );

    final _danceCard = new Container(
      padding: new EdgeInsets.all(12.0),
      child: new Row(
        children: <Widget>[
          danceThumbnail,
          danceContent,
          danceDetailContent
        ],
      ),
      height: 112.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: new Offset(0.0, 5.0),
          ),
        ],
      ),
    );

    return new Container(
      height: 112.0,
      margin: new EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: _danceCard,
    );
  }
}