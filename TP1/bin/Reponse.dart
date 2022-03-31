class Reponse{
   String title;
   bool isCorrect;


  Reponse(this.title, this.isCorrect);

  @override
  String toString() {
    return '\n $title';
  }
}