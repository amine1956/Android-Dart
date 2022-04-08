
import 'package:flutter/material.dart';

import 'Produit.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  TextEditingController controller=new TextEditingController();
  TextEditingController controller1=new TextEditingController();
  List<Produit> Produits=[Produit("pc",140),Produit("cmavier",90),Produit("Ecrant",80)];

  void deleteItem(int index){
    Produits.removeAt(index);
    Produits.forEach((e) {
      print(e);
    });
  }
  void addItem(){
    Produit P=Produit(controller.text, int.parse(controller1.text));
    Produits.add(P);
    controller.clear();
    controller1.clear();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(title: Text("Gestion des produits")),
        body: Padding(

          padding: EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("PRPDUITS",
                    style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
                TextField(
                  controller: controller,
                  style: TextStyle(fontSize: 30,color: Colors.black87),
                  decoration: new InputDecoration(

                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                      hintText: 'le non du produit',
                      helperText: '',
                      labelText: 'Nom',
                      prefixIcon: const Icon(Icons.production_quantity_limits_sharp
                        , color: Colors.green,),
                      prefixText: ' ',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                )
                ,
                TextField(
                  controller: controller1,
                  style: TextStyle(fontSize: 30,color: Colors.black87),

                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                      hintText: 'le prix du produit',
                      helperText: ' ',
                      labelText: 'Prix',
                      prefixIcon: const Icon(Icons.price_change_sharp
                        , color: Colors.green,),
                      prefixText: ' ',
                      suffixText: 'USD',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),
                MaterialButton(
                    color: Colors.blueAccent,
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        addItem();
                      });
                    }),
                Expanded(child:ListView.builder(
                    itemCount: Produits.length,
                    itemBuilder:(BuildContext context,int index){
                      print(index);
                      return Card(
                        elevation: 100,
                        child: ListTile(
                          leading: CircleAvatar(child: Text(Produits[index].nom.substring(0,1))),
                          trailing: IconButton(
                              icon:Icon(Icons.delete),
                              onPressed: (){
                                setState(() {
                                  deleteItem(index);
                                });
                              }),

                          title:
                          Text("${Produits[index].nom}"),
                          subtitle:
                          Text("${Produits[index].prix}"),
                        )
                        ,);

                    }
                ) )

              ]
          ),

        ) ,
      ),
    );
  }
}
