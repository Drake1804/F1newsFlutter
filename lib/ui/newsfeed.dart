import 'package:f1news/data/repository.dart';
import 'package:f1news/ui/widgets.dart';
import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  var newsList;
  late bool loading;

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
      appBar: F1NewsAppBar(f1News),
      body: SafeArea(
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: newsList.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                  title: newsList[index].title ?? "",
                                  description:
                                      newsList[index].description ?? "",
                                  imageUrl: newsList[index].image ?? "",
                                  pubDate: newsList[index].pubDate ?? "",
                                  link: newsList[index].link ?? "");
                            }),
                      )
                    ],
                  ),
                )),
    );
  }
}
