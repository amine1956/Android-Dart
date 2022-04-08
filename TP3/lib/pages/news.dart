import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class news extends StatefulWidget {
  @override
  State<news> createState() => _GitHubUsersState();
}

class _GitHubUsersState extends State<news> {
  var users=null;
  TextEditingController textEditingController=new TextEditingController();
  TextEditingController textEditingController1=new TextEditingController();

  void searchNews(key,date){
    String url= "https://newsapi.org/v2/everything?q={${key}}&from={${date}}&apiKey=3cf8c4eb320946bf9d88200dd85311b3";
    http.get(Uri.parse(url))
        .then((response) {
      setState(() {
        users= json.decode(response.body);
        print(users);
        print(url);
      });
    }).catchError((onError){
      print(onError);
    });
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
                    setState(() {
                      searchNews(textEditingController.text,textEditingController1.text);
                    });
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(

                itemCount:users==null||users["articles"]==null?0: users["articles"].length,
                itemBuilder: (context, index) {
                 return Card(
                      elevation: 100,

                      child: ListTile(
                   leading: CircleAvatar(
                     backgroundImage: NetworkImage(users["articles"][index]["urlToImage"]),
                   ),
                    title: Text(users["articles"][index]["source"]["name"]),
                ));
              },),
            )
          ],
        ),
      ),
    );
  }
}
