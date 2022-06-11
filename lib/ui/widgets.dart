import 'package:f1news/utils/constants.dart';
import 'package:flutter/material.dart';

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
