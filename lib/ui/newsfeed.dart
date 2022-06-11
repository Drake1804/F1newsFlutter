import 'package:f1news/data/news.dart';
import 'package:f1news/data/repository.dart';
import 'package:f1news/ui/widgets.dart';
import 'package:f1news/utils/Constants.dart';
import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  var newsList = [];
  bool loading = false;

  void getNews() async {
    NewsRepository repository = NewsRepository();
    newsList = await repository.getNewsRemote();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const F1NewsAppBar(appName),
      body: SafeArea(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: margin_16),
                        height: MediaQuery.of(context).size.height,
                        child: getListView(),
                      )
                    ],
                  ),
                )),
    );
  }

  ListView getListView() {
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
