import 'package:flutter/material.dart';
import 'package:online_shop_project/views/shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Profil", style: appstyle(40, Colors.black, FontWeight.bold),)),
    );
  }
}