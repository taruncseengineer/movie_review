import 'package:Movierecommandation/ui/firstPage.dart';
import 'package:Movierecommandation/ui/profile.dart';
import 'package:Movierecommandation/ui/searchpage.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BotomNBar extends StatefulWidget {
  // const BotomNBar({Key key, this.user}) : super(key: key);
  @override
  _BotomNBarState createState() => _BotomNBarState();
}

class _BotomNBarState extends State<BotomNBar> {
  int _selectedIndex = 0;

  void onTapBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [
    FirstPage(),
    SearchPage(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: onTapBar,
          currentIndex: _selectedIndex,
          elevation: 0.1,
          iconSize: 20,
          // backgroundColor: firstcolor.withOpacity(0.5),
          selectedItemColor: firstcolor,
          unselectedItemColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  "Search",
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person),
            //     title: Text(
            //       "Profile",
            //       style: TextStyle(fontWeight: FontWeight.w700),
            //     )),
          ]),
    );
  }
}
