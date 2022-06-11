import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:f1news/data/news.dart';

class NewsRepository {
  Future<List<News>> getNewsRemote() async {
    List<News> newsList = [];

    String url = "http://0.0.0.0:8080/newsFeed";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    jsonData.forEach((element) {
      var news = News(
          title: element['title'],
          image: element["image"],
          description: element["description"],
          pubDate: element["pubDate"],
          link: element["link"]);
      newsList.add(news);
    });
    return newsList;
  }
}
