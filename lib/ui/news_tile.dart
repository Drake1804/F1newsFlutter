import 'package:f1news/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'article.dart';

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
          elevation: 4,
          child: Column(
            children: [
              ClipRRect(
                  child: Image.network(
                imageUrl,
                height: newsFeedImageHeight,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )),
              const SizedBox(height: margin_8),
              Padding(
                padding:
                    const EdgeInsets.only(left: margin_16, right: margin_8),
                child: Text(
                  title.trim(),
                  maxLines: descriptionMaxLines,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black87,
                      fontSize: fontTitleSize,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: margin_4),
              Padding(
                padding:
                    const EdgeInsets.only(left: margin_16, right: margin_8),
                child: Text(description.trim(),
                    maxLines: descriptionMaxLines,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.black54,
                        fontSize: fontDescriptionSize,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: margin_16)
            ],
          )),
    );
  }
}
