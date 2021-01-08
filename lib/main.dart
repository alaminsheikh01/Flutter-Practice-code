import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

//stater code

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppStore();
  }
}

class MyAppStore extends State<MyApp> {
  final question = const [
    {
      'questionText': 'Wha\'s your favorite color?',
      'answer': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'Wha\'s your favorite animal?',
      'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Wha\'s your favorite Instructor?',
      'answer': ['Mack', 'stive', 'mick', 'Millan'],
    },
  ];

  int answerIndex = 0;

  void answerQuestion() {
    setState(() {
      answerIndex = answerIndex + 1;
    });
    print(answerIndex);
    if (answerIndex < question.length) {
      print('We have more question!');
    } else {
      print('No more question');
    }
  }

  void restart() {
    setState(() {
      answerIndex = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: answerIndex < question.length
            ? Column(
                children: [
                  Question(
                    question[answerIndex]['questionText'],
                  ),
                  ...(question[answerIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(answerQuestion, answer);
                  }).toList()
                ],
              )
            : Column(
                children: [
                  Center(
                    child: Text(
                      'You did it',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    onPressed: restart,
                    child: Text('Reset'),
                    textColor: Colors.blue,
                  )
                ],
              ),
      ),
    );
  }
}
