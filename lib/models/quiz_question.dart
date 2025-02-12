

class QuizQuestion{
  const QuizQuestion(this.text,this.options);
  
  final String text;
  final List<String> options; 

  List <String> getshaffledOptions(){

    final shaffledList = List.of(options);
    shaffledList.shuffle();
    return shaffledList;

  }
}