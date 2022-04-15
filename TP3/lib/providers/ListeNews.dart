import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class listeVluseState extends ChangeNotifier{
var users=null;
void searchNews(key,date){
  String url= "https://newsapi.org/v2/everything?q={${key}}&from={${date}}&apiKey=3cf8c4eb320946bf9d88200dd85311b3";
  http.get(Uri.parse(url))
      .then((response) {
      users= json.decode(response.body);
      print(users);
      print(url);
      notifyListeners();
  }).catchError((onError){
    print(onError);
  });
}

}