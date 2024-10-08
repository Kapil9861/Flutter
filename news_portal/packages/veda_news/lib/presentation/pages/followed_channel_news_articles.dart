import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/data/models/articles.dart';
import 'package:veda_news/presentation/pages/favourite_articles.dart';
import 'package:veda_news/presentation/pages/home_page.dart';
import 'package:veda_news/presentation/providers/followed_channels_news_article_provider.dart';
import 'package:veda_news/presentation/widgets/article_tile.dart';
import 'package:veda_news/presentation/widgets/channels_screen.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';

class FollowedNewsChannelArticle extends ConsumerStatefulWidget {
  const FollowedNewsChannelArticle({
    super.key,
  });

  @override
  ConsumerState<FollowedNewsChannelArticle> createState() =>
      _FollowedNewsChannelArticleState();
}

class _FollowedNewsChannelArticleState
    extends ConsumerState<FollowedNewsChannelArticle> {
  @override
  Widget build(BuildContext context) {
    final favouriteArticles = ref.watch(followedNewsArticlesProvider).newsModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 56,
        title: IconButton(
          icon: Image.asset("assets/logo/Vector.png"),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ChannelsScreen();
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
              CustomSnackbar()
                  .show(context, "This feature is not available yet!");
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: favouriteArticles.articles != null &&
              favouriteArticles.articles!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListView.builder(
                itemCount: favouriteArticles.articles!.length,
                itemBuilder: (context, index) {
                  Articles article = favouriteArticles.articles![index];
                  return ArticleTile(
                    article: article,
                  );
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
                ),
    );
  }
}
