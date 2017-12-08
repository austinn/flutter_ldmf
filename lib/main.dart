import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_ldmf/layouts/filter_chip_item.dart';
import 'package:flutter_ldmf/layouts/home_page_body.dart';
import 'package:flutter_ldmf/models/dance.dart';
import 'package:flutter_ldmf/models/filter_chip.dart';
import 'package:flutter_ldmf/views/app_bar_layout.dart';

void main() {
  runApp(new MaterialApp(
    title: 'ldmf',
    home: new HomePage(),
  ));
}

/**
 *
 */
class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

/**
 *
 */
class HomePageState extends State<HomePage> {

  /**
   * Load our dance data
   */
  List<Dance> dances = new List<Dance>();

  Future<String> _loadJSONAsset() async {
    return await rootBundle.loadString('assets/json/dances.json');
  }

  Future loadDances() async {
    String jsonDances = await _loadJSONAsset();
    setData(jsonDances);
  }

  void setData(jsonString) {
    this.setState(() {
      List temp = JSON.decode(jsonString);
      for (var i = 0; i < temp.length; i++) {
        this.dances.add(new Dance.JSON(temp[i]));
      }
    });
  }

  /**
   * Load our chip data
   */
  List<FilterChip> chips;
  List<int> colorsStart = new List<int>();
  List<int> colorsEnd = new List<int>();

  void initColors() {
    colorsStart.add(0xFFF9D33E);
    colorsStart.add(0xFFA6BF38);
    colorsStart.add(0xFF02F1FE);

    colorsEnd.add(0xFFF58621);
    colorsEnd.add(0xFF53AB47);
    colorsEnd.add(0xFF2ECAFE);
  }

  void initChips() {
    chips = new List<FilterChip>();
    chips.add(new FilterChip(filter: 'level',
        value: 'beginner',
        color1: 0xFFF9D33E,
        color2: 0xFFF58621));
    chips.add(new FilterChip(filter: 'count',
        value: '32',
        color1: colorsStart[1],
        color2: colorsEnd[1]));
    chips.add(new FilterChip(filter: 'walls',
        value: '4',
        color1: colorsStart[2],
        color2: colorsEnd[2]));
  }

  @override
  void initState() {
    initColors();
    initChips();
    loadDances();
  }

  /**
   * Build our 'Home Page'
   * as defined by an app bar,
   * chip container, and listview
   */

  @override
  Widget build(BuildContext context) {

    /**
     * Background Gradient
     */
    final _background = new BoxDecoration(
      gradient: new LinearGradient(
        colors: [
          const Color(0xFFF8FAFD),
          const Color(0xFFF1F8FB)
        ],
        begin: const FractionalOffset(1.0, 1.0),
        end: const FractionalOffset(0.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );

    /**
     * RaisedButton onPressed
     */
    void _addFilterChip() {
      var index = chips.length % 3;

      setState(() {
        chips.add(new FilterChip(filter: 'test',
            value: 'testing',
            color1: colorsStart[index],
            color2: colorsEnd[index]));
      });

      Navigator.pop(context);
    }

    /**
     * FAB onPressed
     */
    void _showFilterDialog() {
      showDialog(
          context: context,
          child: new SimpleDialog(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(32.0),
                child: new RaisedButton(
                  color: Colors.pinkAccent,
                  elevation: 4.0,
                  onPressed: _addFilterChip,
                  child: new Container(
                    alignment: Alignment.center,
                    child: new Text(
                      'Apply',
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      );
    };

    /**
     * Layouts
     */
    final _chipViewLayout = new Container(
      height: 38.0,
      child: new CustomScrollView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildBuilderDelegate((BuildContext context,
                int index) {
              return new GestureDetector(
                onTap: () {
                  setState(() {
                    chips.removeAt(index);
                  });
                },
                child: new FilterChipItem(
                    chips[index], color1: chips[index].color1,
                    color2: chips[index].color2),
              );
            },
                childCount: (null == chips) ? 0 : chips.length
            ),
          ),
        ],
      ),
    );

    final _filterLayout = new Container(
        padding: new EdgeInsets.only(left: 12.0, right: 12.0, top: 24.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new GestureDetector(
                onTap: _showFilterDialog,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Dances",
                      style: new TextStyle(
                        color: new Color(0xAA5C727C),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(right: 8.0),
                  child: new Image(
                    image: new AssetImage("assets/img/filters.png"),
                    height: 24.0,
                  ),
                )
              ],
            )
          ],
        )
    );

    /**
     * What we actually return
     */
    return new Scaffold(
      body: new Container(
        decoration: _background,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new LDMFAppBar("LDMF"),
            _chipViewLayout,
            _filterLayout,
            new HomePageBody(dances)
          ],
        ),
      ),
    );
  }
}