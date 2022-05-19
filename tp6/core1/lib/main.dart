import 'package:core1/page/PageCotact.dart';
import 'package:core1/reposetories/contactReposetory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ContactBloc.dart';
import 'bloc/ContactState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactBloc( ContactInitialState(), ContactRepository())  )
        ],
        child: MaterialApp(
          title: 'Contact app',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          routes: {
            "/contacts": (context) => ContactsPage()
          },
          initialRoute: "/contacts",
        )
    );
  }
}

