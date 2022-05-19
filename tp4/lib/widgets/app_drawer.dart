import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp22/widgets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              CircleAvatar(
                child: Image.network(
                    'https://avatars.githubusercontent.com/u/73759527?v=4'),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text("mohamed amine khammour"),
            ],
          )),
          DrawerItem("Home","/",Icon(Icons.home)),
          DrawerItem("Contacts","/contacts",Icon(Icons.contacts)),
          DrawerItem("Github Users","/github_users",Icon(Icons.supervised_user_circle)),
          DrawerItem("News","/news",Icon(Icons.newspaper)),
          DrawerItem("Covid 19","/covid",Icon(Icons.airplay_rounded)),
          DrawerItem("About","/about",Icon(Icons.error)),

        ],
      ),
    );
  }
}
