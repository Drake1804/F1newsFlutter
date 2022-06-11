import 'package:flutter/material.dart';

import 'article.dart';

const String f1News = "F1 News";
const double imageHeight = 200;

class F1NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const F1NewsAppBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                title,
                maxLines: 1,
                softWrap: true
            )
          ],
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
        children: const [Text(f1News)],
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
      {required this.description,
      required this.title,
      required this.imageUrl,
      required this.pubDate,
      required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(link, title)));
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(bottom: 4, top: 4),
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                const SizedBox(height: 2),
                ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      imageUrl,
                      height: imageHeight,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: 2),
                Text(
                  title.trim(),
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(description.trim(),
                    maxLines: 2,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 12)),
                const SizedBox(height: 8)
              ],
            ),
          )),
    );
  }
}
