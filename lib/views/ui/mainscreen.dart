


import 'package:flutter/material.dart';

import 'package:online_shop_project/controllers/mainscreen_provider.dart';
import 'package:online_shop_project/views/ui/cartPage.dart';
import 'package:online_shop_project/views/ui/homePage.dart';
import 'package:online_shop_project/views/ui/profile.dart';
import 'package:online_shop_project/views/ui/searchPage.dart';
import 'package:provider/provider.dart';

import '../shared/bottom_nav_bar.dart';


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
      


      body:pageList[mainScreenNotifier.pageIndex],
      bottomNavigationBar: const BottomNavBar(),
      
    );
   },);
  }
}




