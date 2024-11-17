import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> items = [
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.white,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        screenWidth > 600 ? 3 : 2; // Set column count based on screen width

    // Check if item count is odd and add an empty container for centering
    List<Color?> displayItems = List.from(items);
    if (displayItems.length.isOdd && displayItems.length > 2) {
      displayItems.insert(
          displayItems.length - 1, null); // Insert a null item to center last
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: displayItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          Color? color = displayItems[index];
          if (color == null) {
            // Render an empty container to take up space for centering
            return Container();
          }
          return _buildGridItem(color);
        },
      ),
    );
  }

  Widget _buildGridItem(Color color) {
    return Container(
      color: color,
      child: const Center(
        child: Text(
          'Item',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
