import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: Card(
            /// Background color
            color: Colors.black,
            child: TabBar(
              /// Unselected icon color
              unselectedLabelColor: Colors.black12,

              ///Selected icon color
              labelColor: Colors.white,

              ///Indicator color
              indicatorColor: Colors.black,

              ///Removes the selector decoration
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 0),
              ),
              tabs: [
                new Tab(icon: new Icon(Icons.home)),
                new Tab(icon: new Icon(Icons.notifications)),
                new Tab(icon: new Icon(Icons.add_circle)),
                new Tab(icon: new Icon(Icons.account_circle)),
                new Tab(icon: new Icon(Icons.star)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new Icon(Icons.home),
              new Icon(Icons.notifications),
              new Icon(Icons.add_circle),
              new Icon(Icons.account_circle),
              new Icon(Icons.star),
            ],
          ),
        ),
      ),
    );
  }
}
