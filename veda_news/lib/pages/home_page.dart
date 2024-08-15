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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: _buildUI(context),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: _newsRepository.fetchNewsFromApi(),
      builder: (context, snapshot) {
        print(snapshot);
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
}
