
import 'dart:math';

import '../model/contact.dart';

class ContactRepository {

  List<Contact> contacts = [

    Contact(id: 1, name: "amine", group: "BDCC", profile: "MA", email: "amine@gmail.com", lastMessage: "Bonjour", lastMessageDate: "20/05/2022"),
    Contact(id: 2, name: "amina", group: "GLSID", profile: "AM", email: "amina@gmail.com", lastMessage: "Bonjour", lastMessageDate: "20/05/2022"),
    Contact(id: 3, name: "amiiiiiiiine", group: "BDCC", profile: "MV", email: "amiiiiiiiine@gmail.com", lastMessage: "Bonjour", lastMessageDate: "20/05/2022"),
    Contact(id: 4, name: "amooooooooon", group: "BDCC", profile: "NV", email: "amooooooooon@gmail.com", lastMessage: "Bonjour", lastMessageDate: "20/05/2022"),
    Contact(id: 5, name: "amooooo", group: "GLSID", profile: "HR", email: "amooooo@gmail.com", lastMessage: "Bonjour", lastMessageDate: "20/05/2022"),
    Contact(id: 6, name: "jilali", group: "GLSID", profile: "VR", email: "jilali@gmail.com", lastMessage: "Bonjour", lastMessageDate: "20/05/2022"),
  ];

  Future<List<Contact>> getAllContacts() async {
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    return contacts;
  }

  Future<List<Contact>> getContactsByGroup( String group) async{
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    var groupeContacts = contacts.where((element) => element.group==group).toList();
    return groupeContacts;
  }

}