import 'package:dishashop/Activities/BlankPage.dart';
import 'package:dishashop/Activities/CreateFormPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Activities/FormTypesPage.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  static const List<Widget> pages = <Widget>[FormTypesPage(), CreateFormPage()];
  static int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Formularios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_sharp),
            label: 'Mas Opciones',
          ),
        ],
      ),
    );
  }
}
