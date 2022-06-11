import 'package:f1news/ui/newsfeed.dart';
import 'package:f1news/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appName,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const NewsFeed(),
        debugShowCheckedModeBanner: false);
  }
}
