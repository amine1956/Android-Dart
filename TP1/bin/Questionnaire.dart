import 'Question.dart';

class Questionnaire {
  late String title;
  late List<Question> questions;

  Questionnaire(this.title, this.questions);

  @override
  String toString() {
    return 'Questionnaire de $title \n, questions: $questions';
  }

}