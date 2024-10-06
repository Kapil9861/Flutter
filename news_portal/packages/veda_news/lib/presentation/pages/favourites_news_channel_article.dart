import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/presentation/providers/logo_provider.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';

class FavouritesNewsChannelArticle extends ConsumerStatefulWidget {
  const FavouritesNewsChannelArticle({
    super.key,
    required this.sourceId,
    required this.sourceName,
  });
  final String sourceId;
  final String sourceName;

  @override
  ConsumerState<FavouritesNewsChannelArticle> createState() =>
      _FavouritesNewsChannelArticleState();
}

class _FavouritesNewsChannelArticleState
    extends ConsumerState<FavouritesNewsChannelArticle> {
  final _logoProvider = LogoProvider();
  @override
  Widget build(BuildContext context) {
    final logo = _logoProvider.getLogo(widget.sourceName);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Image.network(logo),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: StyledText(fontSize: 14, text: widget.sourceName),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Follow"),
                ),
              ],
            )),
      ),
    );
  }
}
