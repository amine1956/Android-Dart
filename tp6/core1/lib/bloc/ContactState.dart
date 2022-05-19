import '../model/contact.dart';

enum RequestState { Loaded, Loading, Error, None}
class ContactState {

  List<Contact> contacts = [];
  RequestState requestState;
  String errorMessage;

  ContactState({ required this.contacts, required this.requestState, required this.errorMessage});
  @override
  List<Object?> get props  => [ contacts, requestState, errorMessage];
}

class ContactInitialState extends ContactState {

  ContactInitialState() : super(contacts: [], errorMessage: "", requestState: RequestState.None);

}