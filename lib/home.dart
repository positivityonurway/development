import 'package:flutter/material.dart';
import 'browsers.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Building {
  int id;
  String name;
  String place;
  IconData icon;

  Building({this.id, this.name, this.place, this.icon});
}

checkID(int val) {

   if(val==4)
    return browsers();
    return false;
}

class CardPage extends StatelessWidget {
  final Building building;
  CardPage({this.building});
  Widget build(context) {
    if (building.id == 4)
      return browsers();
//    else if (building.id == 6)
//      return travelApps();
    else
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              ' Page under Development :/ \n\n Your Developers are working on it 24x7.\n Sorry for the delay.\n Get back here soon!',
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          ),
        ),
      );
  }
}

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Icon menuOption = Icon(
    Icons.menu,
    color: Color(0xffd11b5d),
  );
  Widget appBarTitle = Text(
    "Categories",
    style: TextStyle(color: Colors.white, fontSize: 27),
  );

  Icon actionIcon = Icon(
    Icons.search,
    color: Color(0xffd11b5d),
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Building> _list;
  List<Building> _searchList = List();

  bool _IsSearching;
  String _searchText = "";
  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = List();
    _list.add(
      Building(
          id: 1, name: "Social", place: "Social", icon: FontAwesomeIcons.users),
    );
    
    _searchList = _list;
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: GridView.builder(
          itemCount: _searchList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: Uiitem(_searchList[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CardPage(building: _searchList[index])));
                });
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          )

         
      bottomNavigationBar: footer1(),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }

  List<Building> _buildList() {
    return _list; 
  }

  List<Building> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList =
          _list; 
    } else {
     
      _searchList = _list
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
              element.place.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList; 
    }
  }



  Widget buildBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xffd11b5d),
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Color(0xffd11b5d)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Color(0xffd11b5d),
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Search here..",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Color(0xffd11b5d),
      );
      this.appBarTitle = Text(
        "Cats",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
      
       Widget buildFooter(BuildContext context) {
   return BottomAppBar(
     child: Center(
       child: Text(
         "Shimano",
         style: TextStyle(color: Color(0xffd11b5d)),
       ),
     ),
     color: Colors.black12,
   );
 }

class Uiitem extends StatelessWidget {
  final Building building;
  Uiitem(this.building);

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      margin: EdgeInsets.fromLTRB(9, 9, 9, 9),
      elevation: 10.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              colors: [Color(0xff420420), Color(0xffd11b5d)],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 20.0 / 13,
//              icon: Icon(Icons.volume_up),
              child: Center(
                child: FaIcon(
                  this.building.icon,
//                color: Color(0xff00008b),
//                color: Color(0xff03256c),
                  color: Colors.white,

                  size: 45,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1.0),
              child: Text(
                this.building.name,
                style: TextStyle(
//                          color: Color(0xff00008b),
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5),
              ),
            ),
            SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }
}
