import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/models/articles.dart';
import 'package:veda_news/data/models/source.dart';
import 'package:veda_news/presentation/providers/drift/favourites_provider.dart';
import 'package:veda_news/presentation/widgets/article_tile.dart';
import 'package:veda_news/presentation/widgets/channels_screen.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';

class FavouriteArticles extends ConsumerWidget {
  const FavouriteArticles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteArticlesStream = ref.watch(getFavouritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const StyledText(
          fontSize: 16,
          text: "Favourite Articles",
          fontWeight: FontWeight.w800,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ChannelsScreen();
                  },
                ),
              );
            },
            child: const StyledText(
              text: "Followed Channels",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: favouriteArticlesStream.maybeWhen(
          orElse: () {
            return const Center(
              child: StyledText(fontSize: 14, text: "Something went wrong!"),
            );
          },
          data: (data) {
            List<Favourite> articles = data;
            if (articles.isEmpty) {
              return const Center(
                child: StyledText(
                  fontSize: 13,
                  text: "You do not have favourite articles yet!",
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  Favourite favourite = articles[index];
                  Articles article = Articles(
                    source: Source(
                        id: favourite.sourceId ?? "",
                        name: favourite.sourceName ?? ""),
                    author: favourite.author ?? "",
                    title: favourite.title ?? "",
                    description: favourite.description ?? "",
                    url: favourite.url ?? "",
                    urlToImage: favourite.urlToImage ?? "",
                    publishedAt: favourite.publishedAt ?? "",
                    content: favourite.content ?? "",
                  );
                  return ArticleTile(article: article);
                },
              );
            }
          },
          error: (error, stackTrace) => Center(
            child: StyledText(
              fontSize: 13,
              text: error.toString(),
            ),
          ),
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
