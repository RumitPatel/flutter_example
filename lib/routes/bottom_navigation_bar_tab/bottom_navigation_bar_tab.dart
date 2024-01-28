import 'package:flutter_example/routes/bottom_navigation_bar_tab/tab_one_route.dart';
import 'package:flutter_example/routes/bottom_navigation_bar_tab/tab_two_route.dart';
import 'package:flutter/material.dart';

import '../../utilities/theme_utils.dart';

class BottomNavigationBarTab extends StatefulWidget {
  const BottomNavigationBarTab({super.key});

  @override
  State<BottomNavigationBarTab> createState() => _BottomNavigationBarTab();
}

class _BottomNavigationBarTab extends State<BottomNavigationBarTab> {
  int _selectedIndex = 0;

  static const List<Widget> _tabWidgets = <Widget>[
    TabOneRoute(),
    TabTwoRoute(),
    Text('Index 2: School', style: myTextStyleBold),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabWidgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[800],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
