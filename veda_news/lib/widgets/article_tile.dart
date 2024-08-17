import 'package:flutter/material.dart';
import 'package:veda_news/models/articles.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({
    super.key,
    required this.article,
  });
  final Articles article;

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 112,
        width: 380,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 96,
                    width: 96,
                    image: NetworkImage(
                      widget.article.urlToImage ??
                          "https://www.shutterstock.com/image-vector/no-image-available-vector-illustration-260nw-744886198.jpg",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8,
                right: 8,
              ),
              child: SizedBox(
                height: 96,
                width: 264,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
