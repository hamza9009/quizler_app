import 'dart:html';

import 'package:flutter/material.dart';
import 'question.dart';
import 'questionbank.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> iconkeeper=[
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  ];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
   'Approximately one quarter of human bones are in the feet.',
   'A slug\'s blood is green.',
  ];
  List<bool> answer=[
    false,
    true,
    true,

  ];
  Questionbank ques =  Questionbank();
  // List<Question> ques=[
  //   Question( a: "You can lead a cow down stairs but not up stairs.",b: false),
  //   Question( a: "Approximately one quarter of human bones are in the feet.",b: true),
  //   Question( a: "A slug\'s blood is green.",b: true),
  //
  //
  // ];
  int questionum =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                ques.questionbank[questionum].questiontext!,
                // questions[questionum],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool? correct = ques.questionbank[questionum].answer;
                if(correct == true){
                  print("your answer is right");
                }
                else{
                  print("lyour answer is not right");
                }
                setState(() {
                  // iconkeeper.add(Icon(Icons.check,color:Colors.green));
                  questionum++;
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool? correct = ques.questionbank[questionum].answer;

                if(correct == true){
                  print("your answer is right");
                }
                else{
                  print("your answer is not right");
                }
                setState(() {
                  // iconkeeper.add(Icon(Icons.check,color:Colors.green));
                  questionum++;
                });
                //The user picked false.
              },
            ),
          ),
        ),
      Row(
        children: iconkeeper,

      )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/