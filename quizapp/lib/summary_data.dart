import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    Color color;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              if (data['correct_answer'] == data['user_answer']) {
                color = const Color.fromARGB(255, 81, 199, 52);
              } else {
                color = const Color.fromARGB(255, 217, 243, 103);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: color),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      ((data["questions_index"] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 65, 117, 229),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
