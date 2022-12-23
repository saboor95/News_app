import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourcesResponse.dart';

import '../../constants/contants.dart';

class ApiManager{


static  Future<SourcesResponse> getSources
    () async {
  var URL = Uri.https(BASE, '/v2/top-headlines/sources',
      {
        "apiKey": APIKEY});
  try {
    Response sources = await http.get(URL);
     var json = jsonDecode(sources.body);
     SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
     return sourcesResponse;

  } catch (e) {
    throw e;
  }
}


static Future <NewsDataModel> getNewsData(String sourceId)async{
  Uri URL=Uri.http(BASE,'/v2/everything',{
  "apiKey": APIKEY,
  "sources":sourceId
  });
  Response response =await http.get(URL);
  var json=jsonDecode(response.body);
NewsDataModel newsDataModel=NewsDataModel.fromJson(json);
return newsDataModel;
  }
}