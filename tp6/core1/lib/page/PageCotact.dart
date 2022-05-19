
import 'package:core1/page/ContactGroup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ContactBloc.dart';
import '../bloc/ContactEvent.dart';
import '../bloc/ContactState.dart';
import 'Allcontact.dart';

class ContactsPage extends StatelessWidget {
  static ContactEvent? contactEvent;

  ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:
        Row(
          children: const [Icon(Icons.contacts,color: Colors.white),
            SizedBox(width: 10,),
            Text("Contacts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25))
          ],
        ),),
        elevation: 0,
      ),

      body:

    Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.fbeb6e44d76d81cbe37a9a35a2ad7a57?rik=S0C8JWoVZWjIEA&pid=ImgRaw&r=0"
              ),
              fit: BoxFit.cover
          )
      ),

      child: Column(

          children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               AlContact(),
              ContactGroup("BDCC"),
                ContactGroup("GLSID"),
         ],
            ),

            Expanded(child:
            BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
              if (state.requestState == RequestState.Loading) {
                return const Center(
                    child: SizedBox(
                        child:
                        CircularProgressIndicator(color: Colors.lightGreen),
                        height: 10.0,
                        width: 200.0));
              }
              if (state.requestState == RequestState.Loaded) {
                return
                  ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return
                        Card(
                          elevation: 100,
                          child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              child:
                              Text(state.contacts[index].profile),foregroundColor: Colors.white),
                          title: Text(state.contacts[index].name),

                          subtitle: Row(
                            children: [Text(
                                state.contacts[index].lastMessage.isNotEmpty
                                    ? "\n\t \tLast message \n\t \t " +
                                    state.contacts[index].lastMessage
                                    : ""), Text(
                                state.contacts[index].lastMessageDate.isNotEmpty
                                    ? "\n\t \tDate \n\t \t" +
                                    state.contacts[index].lastMessageDate
                                    : "")],
                          ),
                          trailing: Text("Groupe : " + state.contacts[index].group),
                      ),
                        );
                    });
              }
              if (state.requestState == RequestState.Error) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Title(
                            color: Colors.redAccent,
                            child:
                            const Icon(Icons.wifi_calling_3_rounded, size: 50, color: Colors.redAccent)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 17.0),
                          child: Center(
                              child: Title(
                                  color: Colors.redAccent,
                                  child: Text(state.errorMessage,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w100,
                                      )))),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ContactBloc>().add(contactEvent!);
                          }, child:const Text("reaload",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(elevation: 0,primary: Colors.redAccent),
                        )
                      ],
                    ));
              }
              return const Center(
                  );
            }))
          ],
        ),

    ),
    );
  }
}