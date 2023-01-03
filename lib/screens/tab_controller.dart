import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/screens/news_card.dart';
import 'package:news_app/screens/tab_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';

import '../models/SourcesResponse.dart';
import '../provider/my_provider.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerSceenState();
}

class _TabControllerSceenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => Tab(
                        child: TabItem(source,
                            widget.sources.indexOf(source) == selectedIndex),
                      ))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
            future:
                ApiManager.getNewsData(sourceId:widget.sources[selectedIndex].id ?? "",Lang: pro.languageCode),
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
            })
      ],
    );
  }
}
