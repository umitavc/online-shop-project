


import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop_project/controllers/mainscreen_provider.dart';
import 'package:online_shop_project/views/ui/cartPage.dart';
import 'package:online_shop_project/views/ui/homePage.dart';
import 'package:online_shop_project/views/ui/profile.dart';
import 'package:online_shop_project/views/ui/searchPage.dart';
import 'package:provider/provider.dart';

import '../shared/bottom_nav_bar.dart';
import '../shared/bottom_nav_widget.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  List <Widget> pageList = const[
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
   
   return Consumer<MainScreenNotifier>(builder: (context, mainScreenNotifier, child) {
      return  Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),


      body:pageList[mainScreenNotifier.pageIndex],
      bottomNavigationBar: const BottomNavBar(),
      
    );
   },);
  }
}




