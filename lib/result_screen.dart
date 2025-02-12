import "package:flutter/material.dart";
import 'package:quizz_app/Data/questions.dart';
import 'package:quizz_app/questions_summary.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.whenrestartQuiz, required this.chosenAnswers});

  final List<String> chosenAnswers;

  final void Function() whenrestartQuiz;
  
  List<Map<String, Object>> getSummarydata() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].options[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummarydata();
    final numofTotalQuestions = questions.length;
    final numofCorrectAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You Answered $numofCorrectAnswer out of $numofTotalQuestions questions correctly"),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: whenrestartQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.refresh),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
