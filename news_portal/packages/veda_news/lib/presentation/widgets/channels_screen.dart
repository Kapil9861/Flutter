import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/presentation/pages/favourites_news_channel_article_tile.dart';
import 'package:veda_news/presentation/providers/drift/followed_source_provider.dart';
import 'package:veda_news/presentation/providers/followed_channels_news_article_provider.dart';
import 'package:veda_news/presentation/pages/favourite_articles.dart';
// import 'package:veda_news/presentation/widgets/styled_text.dart';

class ChannelsScreen extends ConsumerWidget {
  const ChannelsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followedChannels = ref.watch(getFollowedSourcesProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const StyledText(
            fontSize: 16,
            text: "Favourite Channels",
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FavouriteArticles();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/Frame.png',
                height: 21.5,
                width: 18,
              ),
              onPressed: () {
                CustomSnackbar().show(
                  context,
                  "This feature is not available yet!",
                );
              },
            ),
          ],
        ),
        body: followedChannels.maybeWhen(
          orElse: () {
            return const Center(
              child: StyledText(
                  fontSize: 13,
                  text: "Something went worng! Please try again later!"),
            );
          },
          data: (data) {
            if (data.isEmpty) {
              return const Center(
                child:
                    StyledText(fontSize: 13, text: "No channels followed yet!"),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  FollowedSourceData source = data[index];

                  return SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(followedNewsArticlesProvider.notifier)
                            .fetchNewsArticles(
                              context,
                              source: source.sourceId,
                            );
                      },
                      child: FavouritesNewsChannelArticle(
                        id: source.id,
                        sourceName: source.sourceName ?? source.sourceId,
                        sourceId: source.sourceId,
                      ),
                    ),
                  );
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
