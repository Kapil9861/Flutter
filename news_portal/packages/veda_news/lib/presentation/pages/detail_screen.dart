import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/presentation/providers/small_providers.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';
import 'package:resources/resources.dart';

/// The [DetailScreen] widget displays the details of a selected news article.
/// It shows the article's image, title, content, author, and related information
/// such as the channel name and time of publication.
class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({
    super.key,
    required this.imageUrl,
    required this.logo,
    required this.time,
    required this.content,
    required this.title,
    required this.author,
    required this.channelName,
  });

  /// The URL of the article's main image.
  final String imageUrl;

  /// The URL of the logo for the news source.
  final String logo;

  /// The publication time of the article.
  final String time;

  /// The main content of the article.
  final String content;

  /// The title of the article.
  final String title;

  /// The author of the article.
  final String author;

  /// The name of the news channel or source.
  final String channelName;

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  /// The text displayed on the follow button, toggles between "Follow" and "Following".
  @override
  Widget build(BuildContext context) {
    bool isLiked = ref.watch(isLikedProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 2),
            child: Image.asset(width: 19, height: 20, Assets.share),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10.5, top: 3),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _buildUI(context, isLiked),
    );
  }

  /// Builds the main UI for the detail screen, including the article image,
  /// title, content, author, channel name, and a follow button.
  Widget _buildUI(BuildContext context, bool isLiked) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Displays the news source's logo, channel name, publication time,
            /// and a follow button.
            SizedBox(
              width: MediaQuery.of(context).size.width - 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Image.network(
                            height: 50,
                            width: 50,
                            widget.logo,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledText(
                              fontSize: 16,
                              text: widget.channelName,
                              fontWeight: FontWeight.w600,
                              fontColor: Colors.black,
                            ),
                            StyledText(
                              fontSize: 14,
                              text: widget.time,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (widget.channelName != "[Removed]" &&
                      widget.channelName.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        ref.read(isLikedProvider.notifier).state = !isLiked;
                      },
                      child: isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            )
                          : const Icon(Icons.favorite_outline),
                    ),
                  if (widget.channelName != "[Removed]" &&
                      widget.channelName.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        ref.read(followButtonTextProvider.notifier).state ==
                                "Following"
                            ? ref
                                .read(followButtonTextProvider.notifier)
                                .state = "Follow"
                            : ref
                                .read(followButtonTextProvider.notifier)
                                .state = "Following";
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                          child: Container(
                            width: 102,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1877F2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StyledText(
                                  fontSize: 16,
                                  text: ref.watch(followButtonTextProvider),
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /// Displays the main image of the article.
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.network(
                height: 248,
                width: MediaQuery.of(context).size.width - 35,
                widget.imageUrl,
                fit: BoxFit.fill,
              ),
            ),

            /// Displays the article's title and author.
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(fontSize: 14, text: widget.author),
                  StyledText(
                    fontSize: 24,
                    text: widget.title,
                    fontColor: Colors.black,
                  )
                ],
              ),
            ),

            /// Displays the main content of the article.
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: StyledText(
                fontSize: 16,
                text: widget.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
