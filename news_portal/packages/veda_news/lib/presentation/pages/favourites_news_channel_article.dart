import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/presentation/providers/drift/followed_source_provider.dart';

class FavouritesNewsChannelArticle extends ConsumerStatefulWidget {
  const FavouritesNewsChannelArticle({
    super.key,
    required this.sourceId,
    required this.sourceName,
  });
  final String sourceId;
  final String sourceName;

  @override
  ConsumerState<FavouritesNewsChannelArticle> createState() =>
      _FavouritesNewsChannelArticleState();
}

class _FavouritesNewsChannelArticleState
    extends ConsumerState<FavouritesNewsChannelArticle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            )),
      ),
    );
  }
}
