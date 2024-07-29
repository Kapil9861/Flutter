// import 'package:flutter/material.dart';

// class SecondProvider extends StatefulWidget {
//   const SecondProvider({super.key, required this.numbers});
//   final List<int> numbers;

//   @override
//   State<SecondProvider> createState() => _SecondProviderState();
// }

// class _SecondProviderState extends State<SecondProvider> {
//   void handleInput(String operation) {
//     setState(() {
//       if (operation == "add") {
//         int last = widget.numbers.last;
//         widget.numbers.add(last + 1);
//       } else {
//         widget.numbers.removeLast();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     int last = widget.numbers.last;
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
//                 scrollDirection: Axis.horizontal,
//                 itemCount: widget.numbers.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 4.0),
//                     child: Text(
//                       widget.numbers[index].toString(),
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// *******The above code does not work when we go back the state changes so to make them constant we have to use provider****
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_and_maps/providers/my_provider.dart';

class SecondProvider extends StatefulWidget {
  const SecondProvider({super.key});

  @override
  State<SecondProvider> createState() => _SecondProviderState();
}

class _SecondProviderState extends State<SecondProvider> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return SafeArea(
      child: Consumer<MyProvider>(
        builder: (context, myProvider, child) {
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
                  onPressed: () => myProvider.handleChange("add"),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: () => myProvider.handleChange("minus"),
                  child: const Icon(Icons.remove),
                )
              ],
            ),
            body: Column(
              children: [
                Center(
                  child: Text(
                    myProvider.numbers.last.toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myProvider.numbers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          myProvider.numbers[index].toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
