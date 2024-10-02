import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/data/models/articles.dart';
import 'package:veda_news/data/models/news_model.dart';
import 'package:veda_news/presentation/widgets/article_tile.dart';
import 'package:veda_news/data/repositories/news_repository.dart';
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
          onPressed: _reloadHome,
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
      body: _buildUI(context),
    );
  }

  /// Builds the main user interface of the home page.
  ///
  /// The UI is built based on the data fetched from the API.
  Widget _buildUI(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: _fetchNews(category: category, sortBy: sortBy),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data != null && snapshot.data!.articles != null) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Filters(
                  selectedCategory: category.isEmpty ? "all" : category,
                  onCategorySelected: (String selectedCategory) {
                    setState(() {
                      category =
                          selectedCategory == "all" ? "" : selectedCategory;
                      _fetchNews(category: category, sortBy: sortBy);
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      Articles article = snapshot.data!.articles![index];
                      return ArticleTile(
                        article: article,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.data != null && snapshot.data!.articles == null) {
          return Center(
            child: Text(
              "No articles found! \n Notes: 1. Please check your internet connection!\n",
              style: GoogleFonts.poppins(),
            ),
          );
        } else {
          return Center(
            child: Text(
              "Something went wrong!",
              style: GoogleFonts.poppins(),
            ),
          );
        }
      },
    );
  }

  /// Fetches news articles based on the selected [category] and [sortBy] criteria.
  ///
  /// This method interacts with the [NewsRepository] to retrieve the data.
  ///
  /// - [category]: The category of news articles to fetch.
  /// - [sortBy]: The sorting criteria for news articles.
  ///
  /// Returns a [Future] that resolves to a [NewsModel] containing the news data.
  Future<NewsModel> _fetchNews({
    required String category,
    required String sortBy,
  }) async {
    return _newsRepository.fetchNewsFromApi(
      category: category.isEmpty
          ? null
          : category, // Adjust API call for "all" or empty category
      sortBy: sortBy,
    );
  }

  /// Reloads the home page by resetting the selected category and sort criteria.
  ///
  /// This method is triggered when the user taps the logo in the app bar.
  void _reloadHome() {
    setState(() {
      category = "";
      sortBy = "";
      _fetchNews(
        category: category,
        sortBy: sortBy,
      );
    });
  }
}
