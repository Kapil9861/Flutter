import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/data/models/articles.dart';
import 'package:veda_news/presentation/providers/drift/followed_source_provider.dart';
import 'package:veda_news/presentation/providers/followed_channels_news_article_provider.dart';
import 'package:veda_news/presentation/widgets/channels_screen.dart';
import 'package:veda_news/presentation/pages/favourite_articles.dart';
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
  @override
  Widget build(BuildContext context) {
    final channels = ref.watch(getFollowedSourcesProvider);
    final favouriteArticles = ref.watch(followedNewsArticlesProvider).newsModel;
    return favouriteArticles.articles != null &&
            favouriteArticles.articles!.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: favouriteArticles.articles!.length,
              itemBuilder: (context, index) {
                Articles article = favouriteArticles.articles![index];
                return Text("data");
                // return Padding(
                //   padding: const EdgeInsets.all(6),
                //   child: Row(
                //     children: [
                //       ArticleTile(
                //         article: article,
                //       ),
                //       Center(
                //         child: GestureDetector(
                //           onTap: () {},
                //           child: const Icon(Icons.favorite_outline),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          )
        : favouriteArticles.articles != null &&
                (favouriteArticles.articles == null ||
                    favouriteArticles.articles!.isEmpty)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  "Something went wrong!",
                  style: GoogleFonts.lato(),
                ),
              );
  }
}
