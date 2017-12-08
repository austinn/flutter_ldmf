import 'package:flutter/material.dart';
import 'package:flutter_ldmf/layouts/dance_item.dart';
import 'package:flutter_ldmf/models/dance.dart';

class HomePageBody extends StatelessWidget {

  List<Dance> dances;

  HomePageBody(this.dances);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        margin: new EdgeInsets.only(top: 8.0),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.only(bottom: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate((BuildContext context,
                    int index) {
                  return new DanceItem(dances[index]);
                },

                  childCount: (null == dances) ? 0 : dances.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
