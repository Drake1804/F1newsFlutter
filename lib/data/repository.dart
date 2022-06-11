import 'dart:convert';
import 'package:f1news/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:f1news/data/news.dart';

class NewsRepository {
  Future<List<News>> getNewsRemote() async {
    List<News> newsList = [];
    var response = await http.get(Uri.parse(baseUrl + newsFeedRouteUrl));
    var jsonData = jsonDecode(response.body);
    jsonData.forEach((element) {
      newsList.add(News(
          title: element['title'],
          image: element["image"],
          description: element["description"],
          pubDate: element["pubDate"],
          link: element["link"]));
    });
    return newsList;
  }
}
