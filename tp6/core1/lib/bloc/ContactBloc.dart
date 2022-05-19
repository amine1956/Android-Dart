
import 'package:bloc/bloc.dart';

import '../reposetories/contactReposetory.dart';
import 'ContactEvent.dart';
import 'ContactState.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  ContactRepository contactRepository ;
  String lastLoad= "";

  ContactBloc( ContactState contactState, this.contactRepository) : super(ContactInitialState()) {

    on<LoadAllContactsEvent>((event, emit) async {
      lastLoad = "all";
      emit( ContactState(requestState: RequestState.Loading, contacts: [], errorMessage: ""));
      await contactRepository.getAllContacts()
          .then((value) => emit(ContactState(contacts: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(ContactState(contacts: [],requestState: RequestState.Error, errorMessage: error.toString() )));
    });

    on<LoadContactsByGroupEvent>((event, emit) async {
      lastLoad= event.groupe;
      emit( ContactState(requestState: RequestState.Loading, contacts: [], errorMessage: ""));
      await contactRepository.getContactsByGroup( event.groupe )
          .then((value) => emit(ContactState(contacts: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(ContactState(contacts: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

  }
}