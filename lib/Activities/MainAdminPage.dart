import 'package:dishashop/WebServices/WebServices.dart';
import 'package:dishashop/WidgetsCustom/NavBar/CustomTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainAdminPage extends StatefulWidget {
  const MainAdminPage({super.key});

  @override
  State<MainAdminPage> createState() => _MainAdminPageState();
}

class _MainAdminPageState extends State<MainAdminPage> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    WebService().getFormTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomTabBar(),
    );
  }
}
