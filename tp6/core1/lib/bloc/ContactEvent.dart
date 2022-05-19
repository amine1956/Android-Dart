abstract class ContactEvent {
}

class LoadAllContactsEvent extends ContactEvent {}

//class LoadBDCCContactsEvent extends ContactEvent{}
//class LoadGLSIDContactsEvent extends ContactEvent{}

class LoadContactsByGroupEvent extends ContactEvent{
  String groupe;
  LoadContactsByGroupEvent( this.groupe);
}