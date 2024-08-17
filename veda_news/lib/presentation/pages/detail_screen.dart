import 'package:flutter/material.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';

class DetailScreen extends StatefulWidget {
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
  final String imageUrl;
  final String logo;
  final String time;
  final String content;
  final String title;
  final String author;
  final String channelName;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String followButtonText = "Follow";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 2),
            child: Image.asset(width: 19, height: 20, "assets/icons/share.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10.5, top: 3),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 380,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (followButtonText == "Following") {
                          followButtonText = "Follow";
                        } else {
                          followButtonText = "Following";
                        }
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          bottom: 5,
                        ),
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
                                text: followButtonText,
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.network(
                height: 248,
                width: 380,
                widget.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
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
            StyledText(
              fontSize: 16,
              text: widget.content,
            ),
          ],
        ),
      ),
    );
  }
}
