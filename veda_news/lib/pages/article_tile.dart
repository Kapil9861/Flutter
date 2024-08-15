import 'package:flutter/material.dart';
import 'package:veda_news/models/articles.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({
    super.key,
    required this.articles,
  });
  final List<Articles> articles;

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
