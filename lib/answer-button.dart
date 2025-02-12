import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.taphandler,
  });

  final String answerText;

  final void Function() taphandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: taphandler,
      
      style: ElevatedButton.styleFrom(
        
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
         
      ),
      child: Text(answerText,textAlign: TextAlign.center,),
    );
  }
}
