import 'package:flutter/material.dart';
import 'package:news_app/provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Mode_DropDownButton extends StatefulWidget {
  @override
  State<Mode_DropDownButton> createState() => _Mode_DropDownButtonState();
}

class _Mode_DropDownButtonState extends State<Mode_DropDownButton> {


  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return  Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            icon: Icon(Icons.keyboard_arrow_down,color:Colors.green,),
            iconEnabledColor: Colors.green,
            alignment: Alignment.center,
            value:pro.dropdownValue1,
            items: <String>[
              'English',
              'Arabic']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text((value=='English'?AppLocalizations.of(context)!.buttonEnglish:
                AppLocalizations.of(context)!.buttonArabic),
                    style: TextStyle(
                        color:  Colors.green,
                        fontSize: 15)),
              );
            }).toList(),

            onChanged: (String? newValue) {
              newValue=='English'?
              pro.changeLanguage('en')
                  :pro.changeLanguage('ar');
              pro.setSelectedItemLanguage(newValue!);
              pro.dropdownValue1 = newValue;
            }),
      ),);
  }

}
