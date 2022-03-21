class Reponse{
  late String title;
  late bool isCorrect;


  Reponse(this.title, this.isCorrect);

  @override
  String toString() {
    return '\n'
           '$title';
  }
}