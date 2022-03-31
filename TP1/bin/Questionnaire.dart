import 'Question.dart';

class Questionnaire {
   String title;
   List<Question> questions;

  Questionnaire(this.title, this.questions);

  @override
  String toString() {
    return 'Questionnaire de $title \n, questions: $questions';
  }

}