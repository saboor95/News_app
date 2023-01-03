import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/screens/news_card.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';


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
