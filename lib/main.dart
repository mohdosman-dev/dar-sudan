import 'dart:async';
import 'package:dar_sudan/resources/APIRepository.dart';
import 'package:dar_sudan/ui/pages/ExploreScreen.dart';
import 'package:dar_sudan/ui/pages/FavoriteScreen.dart';
import 'package:dar_sudan/ui/pages/HomeScreen.dart';
import 'package:dar_sudan/ui/pages/ListScreen.dart';
import 'package:dar_sudan/ui/pages/ProfileScreen.dart';
import 'package:dar_sudan/ui/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/PhotoBloc.dart';

void main() => runApp(
  MultiBlocProvider(
    providers: [BlocProvider<PhotoBloc>(
      create: (BuildContext context) {
        return PhotoBloc(apiRepository: APIRepository());
      },
      child: BottomNavBar(),
    )],
    child: MaterialApp(
      home: BottomNavBar(),
    ),
  ),
);

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    Home(),
    Favorite(),
    Explore(),
    ListScrn(),
    Profile(),
  ];
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 55.0,
        items: <Widget>[
          Icon(Icons.home, color: Colors.black, size: 30),
          Icon(Icons.favorite_border, color: Colors.black, size: 30),
          Icon(Icons.explore, color: Colors.black, size: 40),
          Icon(Icons.list, color: Colors.black, size: 30),
          Icon(Icons.person_outline, color: Colors.black, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
