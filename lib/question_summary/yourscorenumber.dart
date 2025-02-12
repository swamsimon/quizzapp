import 'package:flutter/material.dart';

class Yourscorenumber extends StatelessWidget{
  const Yourscorenumber({super.key,required this.questionIndex,required this.isCorrectanswer});
  
  final int questionIndex;
  final bool isCorrectanswer;

  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectanswer
        ? Color.fromARGB(255, 150, 198, 241)
        : Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(180)
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }


}