import 'package:components/components.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/models/articles.dart'; // Article model
import 'package:veda_news/presentation/pages/detail_screen.dart'; // Detail screen to show detailed article info
import 'package:veda_news/presentation/providers/drift/followed_source_provider.dart';
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
    this.id = 0,
  });
  final int id;

  /// The article data to be displayed.
  final Articles article;

  @override
  ConsumerState<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends ConsumerState<ArticleTile> {
  final LogoProvider _logoProvider = LogoProvider(); // Instance to fetch logos
  final _database = NewsPortalDatabase();
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
    String sourceId = widget.article.source!.id ?? "independent";

    return SizedBox(
      child: GestureDetector(
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
                  sourceId: sourceId,
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: SizedBox(
            height: 124,
            width: MediaQuery.of(context).size.width - 15,
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
                    height: 200,
                    width: 240,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: StyledText(
                                fontSize: 13,
                                text: truncateWithEllipsis(author, 20),
                              ),
                            ),
                            StreamBuilder(
                              stream: _database.followedSources(sourceId),
                              builder: (context, snapshot) {
                                return snapshot.data != null &&
                                        snapshot.data!.isNotEmpty
                                    ? TextButton(
                                        onPressed: () async {
                                          await _database
                                              .removeFollowedSource(sourceId);
                                        },
                                        child: const StyledText(
                                          fontSize: 14,
                                          text: "Following",
                                          fontColor: Colors.blue,
                                        ),
                                      )
                                    : TextButton(
                                        onPressed: () async {
                                          if (sourceId != "independent") {
                                            await ref
                                                .read(addFollowedSourceProvider
                                                    .notifier)
                                                .add(
                                                  context,
                                                  FollowedSourceCompanion(
                                                    sourceId: d.Value(sourceId),
                                                    sourceName:
                                                        d.Value(channelName),
                                                  ),
                                                );
                                          } else {
                                            CustomSnackbar().show(context,
                                                "The source is not identified");
                                          }
                                        },
                                        child: const StyledText(
                                          fontSize: 14,
                                          fontColor: Colors.blue,
                                          text: "Follow",
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                        StyledText(
                          text: truncateWithEllipsis(title, 40),
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
                                child:
                                    Icon(size: 14, Icons.watch_later_outlined),
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
                ),
                LikeWidget(
                    database: _database,
                    title: title,
                    author: author,
                    description: description,
                    postDuration: postDuration,
                    sourceId: sourceId,
                    channelName: channelName,
                    imageUrl: imageUrl)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LikeWidget extends StatelessWidget {
  const LikeWidget({
    super.key,
    required NewsPortalDatabase database,
    required this.title,
    required this.author,
    required this.description,
    required this.postDuration,
    required this.sourceId,
    required this.channelName,
    required this.imageUrl,
  }) : _database = database;

  final NewsPortalDatabase _database;
  final String title;
  final String author;
  final String description;
  final String postDuration;
  final String sourceId;
  final String channelName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
          // future: _database.isFavourite(title),
          stream: _database.likedStream(title),
          builder: (context, snapshot) {
            bool isLiked = snapshot.data != null && snapshot.data!.isNotEmpty;
            return GestureDetector(
              onTap: () async {
                if (title != "[Removed]") {
                  if (isLiked) {
                    await _database.removeFavourite(title);
                  } else {
                    _database.addFavouriteArticle(
                      FavouritesCompanion(
                        author: d.Value(author),
                        content: d.Value(description),
                        description: d.Value(description),
                        publishedAt: d.Value(postDuration),
                        sourceId: d.Value(sourceId),
                        sourceName: d.Value(channelName),
                        title: d.Value(title),
                        url: d.Value(imageUrl),
                        urlToImage: d.Value(imageUrl),
                      ),
                    );
                  }
                  // final result = await _database.isFavourite(title);
                  // if (result == true) {
                  //   if (widget.id != 0) {
                  //     await _database.removeFavouriteArticle(widget.id);
                  //   }
                  // } else {
                  //   ref.read(isLikedProvider.notifier).state = !isLiked;
                  //   ref.read(addFavouriteArticleProvider.notifier).add(
                  //         context,
                  //         FavouritesCompanion(
                  //           author: d.Value(author),
                  //           content: d.Value(description),
                  //           description: d.Value(description),
                  //           publishedAt: d.Value(postDuration),
                  //           sourceId: d.Value(sourceId),
                  //           sourceName: d.Value(channelName),
                  //           title: d.Value(channelName),
                  //           url: d.Value(imageUrl),
                  //           urlToImage: d.Value(imageUrl),
                  //         ),
                  //       );
                  // }
                } else {
                  CustomSnackbar()
                      .show(context, "The article is not available!");
                }
              },
              child: snapshot.data != null && snapshot.data!.isNotEmpty
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    )
                  : const Icon(Icons.favorite_outline),
            );
          }),
    );
  }
}
