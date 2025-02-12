import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LogoContainer extends StatelessWidget {
  const LogoContainer(this.startQuizz,{super.key});

  

  final void Function() startQuizz; 
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
               'assets/images/quiz-logo.png',
               width: 400,
              color: Color.fromARGB(144, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 400,
             
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Learn The Flatter Way!",
            style: GoogleFonts.actor(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuizz
            ,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white),
            icon: Icon(Icons.play_arrow),
            label: const Text("Start Quiz"),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
