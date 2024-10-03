import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/models/articles.dart'; // Article model
import 'package:veda_news/presentation/pages/detail_screen.dart'; // Detail screen to show detailed article info
import 'package:veda_news/presentation/providers/logo_provider.dart'; // Provider for logos
import 'package:veda_news/presentation/widgets/styled_text.dart'; // Custom text widget
import 'package:core/core.dart';

/// [ArticleTile] is a widget that displays a summary of an article.
/// It contains an image, title, author, source, and a short description.
/// When tapped, it navigates to a detail screen with more information.
class ArticleTile extends ConsumerStatefulWidget {
  const ArticleTile({
    super.key,
    required this.article,
  });

  /// The article data to be displayed.
  final Articles article;

  @override
  ConsumerState<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends ConsumerState<ArticleTile> {
  final LogoProvider _logoProvider = LogoProvider(); // Instance to fetch logos

  @override
  Widget build(BuildContext context) {
    // Fetching and assigning necessary data
    String logo = _logoProvider.getLogo(widget.article.source!.name ?? "");
    String imageUrl = widget.article.urlToImage ??
        "https://www.shutterstock.com/image-vector/no-image-available-vector-illustration-260nw-744886198.jpg";
    String channelName = widget.article.source!.name ?? "Independent";
    String description =
        widget.article.content ?? "Description is not available!";
    String author = widget.article.author ?? "Independent";
    String postDuration =
        calculateTimeAgo(widget.article.publishedAt ?? "Unknown");
    String title = widget.article.title ?? "Not very useful!";

    return GestureDetector(
      onTap: () {
        // Navigate to the DetailScreen when the tile is tapped
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailScreen(
                author: author,
                channelName: channelName,
                logo: logo,
                content: description,
                time: postDuration,
                imageUrl: imageUrl,
                title: title,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.5),
        child: SizedBox(
          height: 112,
          width: MediaQuery.of(context).size.width - 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      height: 96,
                      width: 96,
                      image: NetworkImage(
                        imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  // bottom: 8,
                  right: 8,
                ),
                child: SizedBox(
                  height: 196,
                  width: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        fontSize: 13,
                        text: author,
                      ),
                      StyledText(
                        text: truncateWithEllipsis(title, 45),
                        fontSize: 16,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(logo),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: StyledText(
                                fontSize: 13,
                                text: truncateWithEllipsis(
                                  channelName,
                                  16,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 4,
                                right: 1,
                              ),
                              child: Icon(size: 14, Icons.watch_later_outlined),
                            ),
                            StyledText(
                              fontSize: 13,
                              text: postDuration,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
