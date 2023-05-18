import 'package:flutter/material.dart';
import 'package:online_shop_project/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';
import 'controllers/mainscreen_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => MainScreenNotifier(), )
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'onlineShop',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:  MainScreen(),
    );
  }
}

