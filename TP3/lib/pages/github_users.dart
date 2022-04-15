import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitHubUsers extends StatefulWidget {
  @override
  State<GitHubUsers> createState() => _GitHubUsersState();
}

class _GitHubUsersState extends State<GitHubUsers> {
  var users=null;
  TextEditingController textEditingController=new TextEditingController();

  void searchGithubUser(userKey){
    String url="https://api.github.com/search/users?q=${userKey}&per_page=10&page=0";
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
        title: Text("Github Users"),
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
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchGithubUser(textEditingController.text);
                    });
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(

                itemBuilder: (context, index) {
                  return Card(
                      elevation: 100,

                      child: ListTile(leading: CircleAvatar(
                     backgroundImage: NetworkImage(users["items"][index]["avatar_url"]),
                   ),
                    title: Text(users["items"][index]["login"]),
                ));
              },),
            )
          ],
        ),
      ),
    );
  }
}
