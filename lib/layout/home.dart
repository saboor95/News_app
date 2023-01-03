import 'package:flutter/material.dart';
import 'package:news_app/screens/drawer_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import '../models/NewsDataModel.dart';
import '../models/categoryData.dart';
import '../screens/catogries_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/news_card.dart';
import '../shared/network/remote/api_manager.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'Home';
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',), fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(selected==false?
        categoryData==null?AppLocalizations.of(context)!.category
            :AppLocalizations.of(context)!.newsapp2:
        AppLocalizations.of(context)!.settings),
          actions: [IconButton(onPressed: (){
            showSearch(context: context, delegate:NewsSearch(),);
          }, icon: Icon(Icons.search,size: 30,))],
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0.0,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))
          ),
        ),
        drawer:
        DrawerScreen(onDrawerSelected),
        body: selected==false?
            categoryData==null?
        CategoriesScreen(onCategorySelected):HomeScreen(categoryData!):SettingsScreen(),


      ),
    );
  }
  CategoryData? categoryData=null;
   bool selected=false;
  void onDrawerSelected(number){
if (number==DrawerScreen.CATEGORIES){
categoryData=null;
selected=false;

}else if(number==DrawerScreen.SETTINGS){
  selected=true;
}
setState(() {
  Navigator.pop(context);
});
  }

  void onCategorySelected(categorySelected){
categoryData=categorySelected;
setState(() {
});
  }
}

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        showResults(context);
      }, icon: Icon(
        Icons.search,
        size: 25, color:
      Colors.green,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.of(context).pop();
    }, icon: Icon(
      Icons.clear,
      size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsDataModel>(
        future: ApiManager.getNewsData(searchKeyWord: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ));
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.data?.message ?? 'Has Error'),
                TextButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
              ],
            );
          }
          if (snapshot.data?.status != "ok") {
            Column(
              children: [
                Text(snapshot.data?.message ?? 'Has Error'),
                TextButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
              ],
            );
          }
          var news = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsCard(news[index]);
                }),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Suggestions'));
  }
}



