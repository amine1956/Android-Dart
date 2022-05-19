import 'package:core1/page/PageCotact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ContactBloc.dart';
import '../bloc/ContactEvent.dart';
import '../bloc/ContactState.dart';

class ContactGroup extends StatelessWidget{
  String a;
  @override
  Widget build(BuildContext context) {
  return              Padding(
    padding: const EdgeInsets.only(
        left: 5, right: 5, top: 10, bottom: 10),
    child: BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) => ElevatedButton(
          onPressed: () {
            ContactsPage.contactEvent = LoadContactsByGroupEvent(a);
            context.read<ContactBloc>().add(ContactsPage.contactEvent!);
          },
          style: ElevatedButton.styleFrom(elevation: 0,
              primary:
              context.read<ContactBloc>().lastLoad == a
                  ? Colors.green
                  : Colors.blue),
          child:  Text(this.a,style: TextStyle(color: Colors.white),)),
    ),
  );
  }

  ContactGroup(this.a);
}