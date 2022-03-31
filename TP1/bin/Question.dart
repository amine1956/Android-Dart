import 'Reponse.dart';

class Question {
 String title;
 String description;
 num score;
List<Reponse> answers;



Question(this.title, this.description, this.score, this.answers);

@override
  String toString() {
    return ' $title : $description \n liste des reponse: $answers';
  }
}