class Produit{
  String nom;
  int prix;

  Produit(this.nom, this.prix);

  @override
  String toString() {
    return '$nom                  $prix';
  }
}