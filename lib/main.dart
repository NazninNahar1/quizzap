import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreChecker = [];
  List<String> questions = [
    'Are you a happy person?',
    'Are you going to attend the meeting?',
    'have you visited abroad?',
    'Do you want to hug your parents?'
  ];
  int questionNumber = 0;
  int trueCount = 0;
  int falseCount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('QuizApp'),
          leading: const Icon(Icons.menu),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                  child: Text(
                questions[questionNumber],
                style: const TextStyle(color: Colors.white, fontSize: 25),
              )),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: const Size(300, 60),
                ),
                onPressed: () {
                  setState(() {
                    scoreChecker.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    questionNumber = Random().nextInt(3);
                    trueCount++;
                  });
                },
                child: const Text(
                  'True',
                  style: TextStyle(fontSize: 20),
                ),
              )),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: const Size(300, 60),
                ),
                onPressed: () {
                  setState(() {
                    scoreChecker.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    questionNumber = Random().nextInt(3);
                    falseCount++;
                  });
                },
                child: const Text('False', style: TextStyle(fontSize: 20)),
              )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: scoreChecker,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent),
              onPressed: () {},
              child: Text(
                ' Right answer: $trueCount       Wrong answer: $falseCount',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
