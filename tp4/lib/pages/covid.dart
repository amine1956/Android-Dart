import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class covid extends StatefulWidget {
  @override
  State<covid> createState() => _GitHubUsersState();
}
Widget titleWidget(title, subtitle, color) {
  return ListTile(
    title: Text(title,
        style: TextStyle(
            color: color, fontSize: 17, fontWeight: FontWeight.w500)),
    trailing: Text(subtitle, style: TextStyle(color: color, fontSize: 14)),
  );
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
   void searchGithubUser(paye){
    String url="https://covid-api.mmediagroup.fr/v1/cases?country=${paye}";
    print(url);
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
        title: Text("Covide "),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [
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
 padding: EdgeInsets.all(10),
                itemCount:users==null||users["All"]==null?0: 1,
                itemBuilder: (context, index) {
                  return Card(

                      elevation: 100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(2),
                              topRight: Radius.circular(2))),
                      //side: BorderSide( color: Colors.black)),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.info_outline,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("${textEditingController.text} Corona Cases",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: <Widget>[
                                //Icon(Icons.timer, color: Colors.black),
                                //  SizedBox(width: 2),
                                Flexible(
                                    child: ListTile(
                                      title: Text(
                                        "LastUpdated:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text(users["All"]["updated"].toString(),
                                          style: TextStyle()),
                                    ))
                              ],
                            ),
                            titleWidget(
                                'Confirmed',
                                users["All"]["confirmed"].toString() ?? '',
                                Colors.blue),
                            titleWidget(
                                'Recovered',
                                users["All"]["recovered"].toString() ?? '',
                                Colors.green),
                            titleWidget(
                                'Deaths',
                                users["All"]["deaths"].toString() ?? '',
                                Colors.red),
                          ],
                        ),
                      ),

                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}