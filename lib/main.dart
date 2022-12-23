import 'package:flutter/material.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/shared/styles/my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}


