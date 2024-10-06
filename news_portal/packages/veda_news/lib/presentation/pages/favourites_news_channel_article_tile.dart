import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/presentation/pages/followed_channel_news_articles.dart';
import 'package:veda_news/presentation/providers/followed_channels_news_article_provider.dart';
import 'package:veda_news/presentation/providers/logo_provider.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';

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
  final _logoProvider = LogoProvider();
  @override
  Widget build(BuildContext context) {
    final logo = _logoProvider.getLogo(widget.sourceName);
    final buttonText = "follow";
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () async {
          await ref
              .read(followedNewsArticlesProvider.notifier)
              .fetchNewsArticles(context, source: widget.sourceId);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FollowedNewsChannelArticle()));
        },
        child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 24,
                        child: Image.network(
                          logo,
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: StyledText(fontSize: 14, text: widget.sourceName),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  child: Text(buttonText),
                ),
              ],
            )),
      ),
    );
  }
}
