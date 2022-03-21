
import 'dart:io';

import 'Question.dart';
import 'Questionnaire.dart';
import 'Reponse.dart';

void main(List<String> arguments) {
  num scrored=0;

  Reponse  r1= Reponse("1962",true);
  Reponse  r2= Reponse("1832",false);
  Reponse r3= Reponse("1998",false);
  List<Reponse> reso=[];
  reso.add(r1);
  reso.add(r2);
  reso.add(r3);
  Question question =Question("Questio1", "quel est votre age", 10, reso);
  List<Question> Q=[];
  Q.add(question);
  Questionnaire questionnaire=Questionnaire("JAVA", Q);
  var line = stdin.readLineSync();

  for(var i=0;i<questionnaire.questions.length;i++){
    print(questionnaire.questions[i]);
    print("saisire la bon reponse");
    line = stdin.readLineSync();
    for(var j=0;j<3;j++){
      if(line==questionnaire.questions[i].answers[j].title&&questionnaire.questions[i].answers[j].isCorrect==true){
        scrored+=questionnaire.questions[i].score;
      }
    }
  }

  print(scrored);
}
