import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/ArticlesModel.dart';

class Api {


 static Future<List<ArticlesModel>> fetchArticles() async {
    List<ArticlesModel>listModel = [];
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=86b0f6dae99f4f21988a83ee245c5757");
    var respons = await http.get(url);
    var responsbody = jsonDecode(respons.body);
    for (var i in responsbody) {
      listModel.add(ArticlesModel(
          author: i ["author"],
          title: i ["title"],
          description: i ["description"],
          url: i ["url"],
          urlToImage: i ["urlToImage"],
          publishedAt: i ["publishedAt"]));
    }
    print(listModel.length);
    print("111111111111");

    return listModel;
  }
 static Future<List<ArticlesModel>> fetchcategoryArticles(String category) async {
    List<ArticlesModel>listModel = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=86b0f6dae99f4f21988a83ee245c5757");
    var respons = await http.get(url);
    var responsbody = jsonDecode(respons.body)["Articles"];
    for (var i in responsbody) {
      listModel.add(ArticlesModel(
          author: i ["author"],
          title: i ["title"],
          description: i ["description"],
          url: i ["url"],
          urlToImage: i ["urlToImage"],
          publishedAt: i ["publishedAt"]));
    }
    return listModel;
  }


}