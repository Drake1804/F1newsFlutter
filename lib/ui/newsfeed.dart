import 'package:f1news/data/news.dart';
import 'package:f1news/data/repository.dart';
import 'package:f1news/ui/widgets.dart';
import 'package:f1news/utils/constants.dart';
import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  var newsList = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const F1NewsAppBar(appName), body: SafeArea(child: getBody()));
  }

  void getNews() async {
    NewsRepository repository = NewsRepository();
    List<News> news = await repository.getNewsRemote();
    setState(() {
      newsList = news;
    });
  }

  Widget getBody() {
    if (newsList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return getListView();
    }
  }

  SingleChildScrollView getListView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: margin_16),
            height: MediaQuery.of(context).size.height,
            child: buildListView(),
          )
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: newsList.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return getNewsTile(newsList[index]);
        });
  }

  NewsTile getNewsTile(News newsItem) {
    return NewsTile(
        title: newsItem.title,
        description: newsItem.description,
        imageUrl: newsItem.image,
        pubDate: newsItem.pubDate,
        link: newsItem.link);
  }
}
