import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/NewsDataModel.dart';

class NewsCard extends StatelessWidget {

  Articles articles;
  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color:Colors.green),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            height: 180,
            imageUrl: articles.urlToImage??"",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(color: Colors.green,)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(articles.author??"",style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade500,
          ),),
          Text(articles.title??"",style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,)),
          Text(articles.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,),
        ],
      ),
    );
  }
}
