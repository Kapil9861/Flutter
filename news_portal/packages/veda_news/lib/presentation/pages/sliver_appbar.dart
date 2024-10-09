import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/data/models/articles.dart';
import 'package:veda_news/presentation/providers/news_articles_providers.dart';
import 'package:veda_news/presentation/providers/small_providers.dart';
import 'package:veda_news/presentation/widgets/article_tile.dart';
import 'package:veda_news/presentation/widgets/channels_screen.dart';
import 'package:veda_news/presentation/pages/favourite_articles.dart';
import 'package:veda_news/presentation/widgets/filters.dart';

/// The [SliverHomePage] widget serves as the main screen of the Veda News Portal.
/// It displays a list of news articles fetched from an API and allows users to filter
/// articles by category and sort criteria.
class SliverHomePage extends ConsumerStatefulWidget {
  const SliverHomePage({super.key});

  @override
  ConsumerState<SliverHomePage> createState() => _SliverHomePageState();
}

class _SliverHomePageState extends ConsumerState<SliverHomePage> {
  /// The [_newsRepository] is used to fetch news data from the API.

  /// The [category] variable stores the currently selected news category.

  /// The [sortBy] variable stores the sorting criteria for news articles.
  String sortBy = "";

  @override
  void initState() {
    ref.read(newsArticlesProvider.notifier).fetchNewsArticles(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String category = ref.watch(selectedCategoryProvider);
    final fetchLiveNews = ref.watch(newsArticlesProvider).newsModel;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            stretch: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            toolbarHeight: 45,
            expandedHeight: 132,
            title: IconButton(
              icon: Image.asset(
                'assets/logo/Vector.png',
                height: 30,
                width: 99,
              ),
              onPressed: () {
                ref
                    .read(newsArticlesProvider.notifier)
                    .fetchNewsArticles(context);
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
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: fetchLiveNews.articles != null &&
                        fetchLiveNews.articles!.isNotEmpty
                    ? Filters(
                        selectedCategory: category.isEmpty ? "all" : category,
                        onCategorySelected: (String selectedCategory) {
                          ref.read(selectedCategoryProvider.notifier).state =
                              selectedCategory;
                          ref
                              .read(newsArticlesProvider.notifier)
                              .fetchNewsArticles(context,
                                  category: selectedCategory);
                        },
                      )
                    : fetchLiveNews.articles != null &&
                            (fetchLiveNews.articles == null ||
                                fetchLiveNews.articles!.isEmpty)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: Text(
                              "Something went wrong!",
                              style: GoogleFonts.lato(),
                            ),
                          ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (fetchLiveNews.articles != null &&
                    fetchLiveNews.articles!.isNotEmpty) {
                  Articles article = fetchLiveNews.articles![index];
                  return ArticleTile(article: article);
                } else {
                  return Center(
                    child: Text(
                      "Something went wrong!",
                      style: GoogleFonts.lato(),
                    ),
                  );
                }
              },
              childCount: fetchLiveNews.articles!.length,
            ),
          ),
        ],
      ),
    );
  }
}
