import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DrawerScreen extends StatelessWidget {
  Function onDrawerSelected;

  DrawerScreen(this.onDrawerSelected);

  static const int CATEGORIES = 1;
  static const int SETTINGS = 2;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              AppLocalizations.of(context)!.newsapp,
              style: TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerSelected(CATEGORIES);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.category,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onDrawerSelected(SETTINGS);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.settings,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}