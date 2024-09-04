import 'package:flutter/material.dart';

class SliverAppHome extends StatelessWidget {
  const SliverAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      automaticallyImplyLeading: true,
      pinned: true, // Ensures the AppBar stays visible at the top
      expandedHeight: size.height * 0.50,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.only(
          bottom: size.height * 0.01,
          start: size.width * 0.1,
        ),
        title: RichText(
          text: const TextSpan(
            text: "New",
            style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\nYou\'ve never seen it before',
                style: TextStyle(fontSize: 11, color: Color(0xFF9B9B9B)),
              ),
            ],
          ),
        ),
        background: Image.network(
          "https://thewatchlounge.co/wp-content/uploads/2020/12/2-37-300x300.jpg",
          fit: BoxFit.fitWidth,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'View all',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
