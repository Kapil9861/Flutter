// import 'package:flutter/material.dart';
// import 'package:socket_and_maps/providers/provider_second.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<int> numbers = [1, 2, 3, 4, 5];

//   void handleInput(String operation) {
//     setState(() {
//       if (operation == "add") {
//         int last = numbers.last;
//         numbers.add(last + 1);
//       } else {
//         numbers.removeLast();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     int last = numbers.last;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Provider Totorial"),
//         ),
//         floatingActionButton: Column(
//           children: [
//             SizedBox(
//               height: height / 2,
//             ),
//             FloatingActionButton(
//               onPressed: () => handleInput("add"),
//               child: const Icon(Icons.add),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             FloatingActionButton(
//               onPressed: () => handleInput("minus"),
//               child: const Icon(Icons.remove),
//             )
//           ],
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Text(
//                 last.toString(),
//                 style: const TextStyle(fontSize: 24, color: Colors.blue),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: numbers.length,
//                 itemBuilder: (context, index) {
//                   return Text(
//                     numbers[index].toString(),
//                     style: const TextStyle(fontSize: 20),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//                     return SecondProvider(numbers: numbers);
//                   }));
//                 },
//                 child: const Text("SecondProvider"))
//           ],
//         ),
//       ),
//     );
//   }
// }
// ***Class with provider , above code is without any providers ***
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_and_maps/providers/my_provider.dart';
import 'package:socket_and_maps/providers/provider_second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return SafeArea(
      child: Consumer<MyProvider>(
        builder: (BuildContext context, myprovider, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Provider Totorial"),
            ),
            floatingActionButton: Column(
              children: [
                SizedBox(
                  height: height / 2,
                ),
                FloatingActionButton(
                  onPressed: () => myprovider.handleChange("add"),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: () => myprovider.handleChange("minus"),
                  child: const Icon(Icons.remove),
                )
              ],
            ),
            body: Column(
              children: [
                Center(
                  child: Text(
                    myprovider.numbers.last.toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: myprovider.numbers.length,
                    itemBuilder: (context, index) {
                      return Text(
                        myprovider.numbers[index].toString(),
                        style: const TextStyle(fontSize: 20),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const SecondProvider();
                      }));
                    },
                    child: const Text("SecondProvider"))
              ],
            ),
          );
        },
      ),
    );
  }
}
