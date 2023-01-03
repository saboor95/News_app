import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourcesResponse.dart';
import '../../../models/LanguageData.dart';
import '../../constants/constants.dart';

class ApiManager{


static  Future<SourcesResponse> getSources
    (String category) async {
  var URL = Uri.https(BASE, '/v2/top-headlines/sources',
      {
        "apiKey": APIKEY,"category":category});
  try {
    Response sources = await http.get(URL);
     var json = jsonDecode(sources.body);
     SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
     return sourcesResponse;

  } catch (e) {
    throw e;
  }
}


static Future <NewsDataModel> getNewsData({String? sourceId, String? searchKeyWord,String? Lang})async{
  Uri URL=Uri.http(BASE,'/v2/everything',{
  "apiKey": APIKEY,
  "sources":sourceId,
    "language":Lang,
    "q":searchKeyWord,

  });
  Response response =await http.get(URL);
  var json=jsonDecode(response.body);
NewsDataModel newsDataModel=NewsDataModel.fromJson(json);
return newsDataModel;
  }

static Future<LanguageData> getLanguageData(String sourceId,String Lang) async{

  Uri URL = Uri.https(
      BASE,
      '/v2/everything',
      {"apiKey":APIKEY,
        "sources":sourceId,
        "language":Lang// to get data by id from api
      }
  );

  Response sources = await http.get(URL);

  var json = jsonDecode(sources.body);

  LanguageData Language_Data = LanguageData.fromJson(json);

  return Language_Data;

}




}