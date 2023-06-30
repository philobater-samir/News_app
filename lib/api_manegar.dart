import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_course_route/model/NewsResponse.dart';
import 'package:news_app_course_route/model/source_response.dart';

class ApiManager{
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=afd086c2b5164f67894a3e34094d9b98
static const String baseUrl = 'newsapi.org';
static Future<SourceResponse> getSources(String categoryId)async{
  var url = Uri.https(baseUrl,'/v2/top-headlines/sources',{
    "apiKey":"afd086c2b5164f67894a3e34094d9b98",
    "category" : categoryId
  });
  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }catch(e){
    throw e ;
  }

}
///https://newsapi.org/v2/everything?q=bitcoin&apiKey=afd086c2b5164f67894a3e34094d9b98
static Future<NewsResponse> getNews(String sourceId)async{
  var url = Uri.https(baseUrl,'/v2/everything',{
    "apiKey":"afd086c2b5164f67894a3e34094d9b98",
    "sources" : sourceId
  });
  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }catch(e){
    throw e ;
  }

}

}