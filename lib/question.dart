import 'package:flutter/material.dart';
import 'package:quizz_app/answer-button.dart';
import 'package:quizz_app/Data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class question extends StatefulWidget {
  const question({super.key,required this.onSelectAnswer});

  final void Function (String options ) onSelectAnswer;
  @override
  State<question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<question> {

  var currentQuestionIndex = 0;

  void ansthequestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    // currentQuestionIndex = currentQuestionIndex + 1;
    setState(() {
    currentQuestionIndex++;   
    });
    
  }

  @override
  Widget build(context) {

    final currentQuestion = questions[currentQuestionIndex];

    

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            
            Text(
            
              currentQuestion.text,
              style: GoogleFonts.actor(
                textStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 40),
            ...currentQuestion.getshaffledOptions().map((options) {
              return AnswerButton(answerText: options,
              taphandler:(){
                  ansthequestion(options);
              },
              );
            })
          ],
        ),
      ),
    );
  }
}
