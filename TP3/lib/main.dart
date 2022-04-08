import 'package:flutter/material.dart';
import 'package:tp22/pages/ProfileUI2%20.dart';
import 'package:tp22/pages/covid.dart';
import 'package:tp22/pages/news.dart';
import 'package:tp22/pages/contacts.dart';
import 'package:tp22/pages/github_users.dart';
import 'package:tp22/pages/home.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          //bodyText1: TextStyle(color: Colors.grey)
        )
      ),
      routes: {
        "/":(context)=>Home(),
        "/contacts":(context)=>Contacts(),
        "/github_users":(context)=>GitHubUsers(),
        "/news":(context)=>news(),
        "/covid":(context)=>covid(),
        "/about":(context)=>ProfileUI2(),

      },

    );
  }

}