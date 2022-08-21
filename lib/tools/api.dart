import 'dart:convert';

import 'package:http/http.dart';

import 'package:news_app/models/articles.dart';

class API {
  Future<List<Article>> getGeneralNews() async {
    String apiKey = '2015ebfc122b4c7b8d189493ec75ab2d';
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=$apiKey');
    var response = await get(url);
    var responseBody = json.decode(response.body);

    List<Article> list = [];
    for (var i in responseBody['articles']) {
      list.add(Article.fromMap(i));
    }
    return list;
  }

  Future<List<Article>> getCatNews(String cat) async {
    String apiKey = '2015ebfc122b4c7b8d189493ec75ab2d';
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey');
    var response = await get(url);
    var responseBody = json.decode(response.body);

    List<Article> list = [];
    for (var i in responseBody['articles']) {
      list.add(Article.fromMap(i));
    }
    return list;
  }
}
