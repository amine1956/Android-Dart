import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class covid extends StatefulWidget {
  @override
  State<covid> createState() => _GitHubUsersState();
}

class _GitHubUsersState extends State<covid> {
  var users=null;
  TextEditingController textEditingController=new TextEditingController();
  Widget titleWidget(title, subtitle, color) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
              color: color, fontSize: 17, fontWeight: FontWeight.w500)),
      trailing: Text(subtitle, style: TextStyle(color: color, fontSize: 14)),
    );
  }
   void searchGithubUser(){
    String url="https://api.covid19api.com/summary";
    http.get(Uri.parse(url))
        .then((response) {
      setState(() {
        users= json.decode(response.body);
      });
    }).catchError((onError){
      print(onError);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchGithubUser();
                    });
                  },
                  icon: Icon(Icons.search),
                )

              ],
            ),
            Expanded(
              child: ListView.builder(

                itemCount:users==null||users["Countries"]==null?0: users["Countries"].length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 100,

                      child: ListTile(

                    leading: CircleAvatar(
                        child: Text(users["Countries"][index]["Country"].substring(0,2))
                    ),
                    title: Text("Confirmed  "+users["Countries"][index]["TotalConfirmed"].toString()),
                    subtitle: Text("Deaths  "+users["Countries"][index]["TotalDeaths"].toString()),

                  ));
                },),
            )

          ],
        ),
      ),
    );
  }
}
