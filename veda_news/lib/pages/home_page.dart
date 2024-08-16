import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/models/articles.dart';
import 'package:veda_news/models/news_model.dart';
import 'package:veda_news/widgets/article_tile.dart';
import 'package:veda_news/repositories/news_repository.dart';
import 'package:veda_news/core/utils.dart';
import 'package:veda_news/widgets/filters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsRepository _newsRepository = NewsRepository();

  String category = "";
  String sortBy = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                showSnackbar(context, "This feature is not available yet!");
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: _buildUI(context),
      ),
    );
  }

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

  Future<NewsModel> _fetchNews({
    required String category,
    required String sortBy,
  }) async {
    return _newsRepository.fetchNewsFromApi(
      category: category.isEmpty ? null : category,
      sortBy: sortBy,
    );
  }

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
