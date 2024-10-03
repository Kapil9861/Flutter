import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/data/models/articles.dart';
import 'package:veda_news/data/models/news_model.dart';
import 'package:veda_news/presentation/providers/news_articles_providers.dart';
import 'package:veda_news/presentation/widgets/article_tile.dart';
import 'package:veda_news/presentation/widgets/filters.dart';

/// The [HomePage] widget serves as the main screen of the Veda News Portal.
/// It displays a list of news articles fetched from an API and allows users to filter
/// articles by category and sort criteria.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  /// The [_newsRepository] is used to fetch news data from the API.

  /// The [category] variable stores the currently selected news category.
  String category = "";

  /// The [sortBy] variable stores the sorting criteria for news articles.
  String sortBy = "";

  @override
  Widget build(BuildContext context) {
    ref.read(newsArticlesProvider.notifier).fetchNewsArticles(context);
    final fetchLiveNews = ref.watch(newsArticlesProvider).newsModel;
    return
        // Navigation bar UI
        Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 56,
        title: IconButton(
          icon: Image.asset(
            'assets/logo/Vector.png',
            height: 30,
            width: 99,
          ),
          onPressed: () {},
        ),
        actions: [
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
      body: fetchLiveNews.articles != null && fetchLiveNews.articles!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Filters(
                    selectedCategory: category.isEmpty ? "all" : category,
                    onCategorySelected: (String selectedCategory) {
                      ref
                          .read(newsArticlesProvider.notifier)
                          .fetchNewsArticles(context, category: category);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: fetchLiveNews.articles!.length,
                      itemBuilder: (context, index) {
                        Articles article = fetchLiveNews.articles![index];
                        return ArticleTile(
                          article: article,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : fetchLiveNews.articles != null &&
                  (fetchLiveNews.articles == null ||
                      fetchLiveNews.articles!.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Center(
                  child: Text("Something went wrong!"),
                ),
    );
  }
}
