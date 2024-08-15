import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/models/news_model.dart';
import 'package:veda_news/repositories/news_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsRepository _newsRepository = NewsRepository();

  String category = "sports";
  String sortBy = "popularity";
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
            onPressed: () {
              setState(() {
                category = "";
                sortBy = "";
                _fetchNews(category: category, sortBy: sortBy);
              });
            },
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/icons/Frame.png',
                height: 21.5,
                width: 18,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("This feature is unavailable for now!"),
                  ),
                );
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
          return ListView.builder(
            itemCount: snapshot.data!.articles!.length,
            itemBuilder: (context, index) {
              String? title = snapshot.data!.articles![index].title;
              if (title != null) {
                return ListTile(
                  title: Text(title),
                );
              }
            },
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
    return _newsRepository.fetchNewsFromApi(category: category, sortBy: sortBy);
  }
}
