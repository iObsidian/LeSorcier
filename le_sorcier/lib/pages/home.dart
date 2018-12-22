import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: Drawer(child: Text("Placedholder for the drawer")),
          appBar: AppBar(
              ///Workaround to set a custom icon to drawer
              leading: Builder(
                builder: (context) => IconButton(
                      icon: new Icon(
                        Icons.supervised_user_circle,
                        color: Colors.white,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
              backgroundColor: Colors.black,
              title: FlatButton(
                  color: Colors.white12,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.white70),
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  })),
          body: TabBarView(
            children: [
              new Icon(Icons.home),
              new Icon(Icons.notifications),
              new Icon(Icons.add_circle),
              new Icon(Icons.account_circle),
              new Icon(Icons.star),
            ],
          ),
          bottomNavigationBar: Card(
            /// Background color
            color: Colors.black,
            child: TabBar(
              /// Unselected icon color
              unselectedLabelColor: Colors.white30,

              ///Selected icon color
              labelColor: Colors.white,

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
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final data = [
    "Hardcoded",
    "Basic",
    "Input",
    "Gauche",
    "Droite",
    "BootyShake",
    "BootyShake",
    "Uno",
    "Dos",
    "Tres"
  ];

  final recentData = ["Recent search"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      /// Clear input
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  /// Leading icon on the left of the app bar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  /// Widget to display after clicking on search result
  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentData
        : data
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    ListView suggestions = ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
      itemCount: suggestionList.length,
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: suggestions,
        bottomNavigationBar: Card(
          color: Colors.black,
          child: TabBar(
            unselectedLabelColor: Colors.white30,
            labelColor: Colors.white,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 0),
            ),
            tabs: [
              new Tab(
                child: Row(
                  children: <Widget>[
                    new Icon(Icons.local_drink),
                    new Container(
                      width: 5,
                    ),
                    Text("Potions")
                  ],
                ),
              ),
              new Tab(
                child: Row(
                  children: <Widget>[
                    new Icon(Icons.supervised_user_circle),
                    new Container(
                      width: 5,
                    ),
                    Text("Users")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
