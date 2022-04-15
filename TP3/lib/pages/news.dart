import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tp22/providers/ListeNews.dart';
import 'package:url_launcher/url_launcher.dart';


class news extends StatelessWidget {
  TextEditingController textEditingController=new TextEditingController();
  TextEditingController textEditingController1=new TextEditingController();
  void _launchURL(String _url) async {
print(_url);
    if (!await launch(_url)) throw 'Could not launch $_url';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                )),

                Expanded(child: TextFormField(
                  controller: textEditingController1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                )),


                IconButton(
                  onPressed: () {

                    Provider.of<listeVluseState>(context,listen: false).searchNews(textEditingController.text,textEditingController1.text);

                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: Consumer<listeVluseState>(
     builder: (context,listeVluseState,child){
       return ListView.builder(

         itemCount:listeVluseState.users==null||listeVluseState.users["articles"]==null?0: listeVluseState.users["articles"].length,
         itemBuilder: (context, index) {
           return Card(
               elevation: 100,

               child: ListTile(
                   onTap: () => _launchURL(listeVluseState.users["articles"][index]["url"]),
                 leading: CircleAvatar(

                   backgroundImage: NetworkImage(listeVluseState.users["articles"][index]["urlToImage"]),

                 ),
                 title: Text(listeVluseState.users["articles"][index]["source"]["name"]),
               ));
         },);
    }
              ),
            )
          ],
        ),
      ),
    );
  }
}
