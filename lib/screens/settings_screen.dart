import 'package:flutter/material.dart';
import '../models/mode_dropdownbutton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35,vertical: 35),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(AppLocalizations.of(context)!.titleButton,style:TextStyle(
    fontSize: 15,fontWeight: FontWeight.bold)),
    SizedBox(height: 25,),
    Mode_DropDownButton(),
  ],
),

    );
  }
}
