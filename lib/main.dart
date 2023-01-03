import 'package:flutter/material.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/provider/my_provider.dart';
import 'package:news_app/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(  ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(pro.languageCode),
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


