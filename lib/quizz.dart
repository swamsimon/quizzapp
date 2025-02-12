import 'package:flutter/material.dart';
import 'package:quizz_app/Data/questions.dart';
import 'package:quizz_app/logo_container.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/result_screen.dart';

class Quizz extends StatefulWidget {
  Quizz({super.key});

  @override
  State<Quizz> createState() {
    return _QuizzState();
  }
}

class _QuizzState extends State<Quizz> {
  List<String> selectedAnswers = [];

  var activescreen = "logo-container";

  void changescreen() {
    setState(() {
      activescreen = 'question';
    });
  }

  void chooseAnswer(String options) {
    selectedAnswers.add(options);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = "result_screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activescreen = "question-screen";
    });
  }

  @override
  Widget build(context) {
    //another way to change the screen
    Widget screenWidget = LogoContainer(changescreen);

    if (activescreen == "question") {
      screenWidget = question(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activescreen == 'result_screen') {
      screenWidget = ResultScreen(
          chosenAnswers: selectedAnswers, whenrestartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 190, 76, 6),
              Color.fromARGB(255, 116, 29, 0)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
          // alternative way of writing the above code
          // child: activescreen == "logo-container"
          //     ? LogoContainer(changescreen)
          //     : question(),
        ),
      ),
    );
  }
}
