import 'package:flutter/material.dart';
import 'package:flutter_ldmf/models/filter_chip.dart';

class FilterChipItem extends StatelessWidget {

  var color1 = 0xFFF9D33E;
  var color2 = 0xFFF58621;
  final FilterChip chip;

  FilterChipItem(this.chip, {this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    final _background = new BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(20.0),
      gradient: new LinearGradient(
        colors: [
          new Color(color1),
          new Color(color2),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );

    return new Container(
        decoration: _background,
        padding: new EdgeInsets.only(left: 6.0, right: 12.0),
        margin: new EdgeInsets.only(left: 12.0),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                print("x");
              },
              child: new Container(
                margin: new EdgeInsets.only(right: 4.0),
                child: new Icon(Icons.cancel, size: 22.0),
              ),
            ),
            new Text(
              chip.filter,
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            new Text(
              ":",
              style: new TextStyle(
                  color: Colors.white
              ),
            ),
            new Text(
              chip.value,
              style: new TextStyle(
                  color: Colors.white
              ),
            ),
          ],
        )
    );
  }
}