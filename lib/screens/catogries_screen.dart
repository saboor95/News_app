import 'package:flutter/material.dart';
import 'package:news_app/models/categoryData.dart';
import 'package:news_app/screens/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';
class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var categories=CategoryData.getCategories(context);
    var pro=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12
            ), itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      onCategorySelect(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
            },
            ),
          )
        ],
      ),
    );
  }
}
