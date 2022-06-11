import 'package:f1news/utils/constants.dart';
import 'package:flutter/material.dart';

import 'article.dart';

class F1NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const F1NewsAppBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title, maxLines: titleMaxLines, softWrap: true)],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class F1NewsBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const F1NewsBackAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text(appName)],
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewsTile extends StatelessWidget {
  final String title, description, imageUrl, pubDate, link;

  const NewsTile(
      {Key? key,
      required this.description,
      required this.title,
      required this.imageUrl,
      required this.pubDate,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(link, title)));
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(bottom: margin_4, top: margin_4),
          child: Container(
            margin: const EdgeInsets.only(left: margin_8, right: margin_8),
            child: Column(
              children: [
                const SizedBox(height: margin_2),
                ClipRRect(
                    borderRadius: BorderRadius.circular(newsFeedCornerRadius),
                    child: Image.network(
                      imageUrl,
                      height: newsFeedImageHeight,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: margin_2),
                Text(
                  title.trim(),
                  maxLines: descriptionMaxLines,
                  softWrap: true,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: fontTitleSize,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: margin_4),
                Text(description.trim(),
                    maxLines: descriptionMaxLines,
                    style: const TextStyle(
                        color: Colors.black54, fontSize: fontDescriptionSize)),
                const SizedBox(height: margin_8)
              ],
            ),
          )),
    );
  }
}
