import 'package:contacts_app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contactList = [];

  List<Contact> get contacts {
    return [..._contactList];
  }

  set contacts(List<Contact> newContacts) {
    _contactList = newContacts;
    notifyListeners();
  }

  void addContact(Contact newContact) {
    _contactList.add(newContact);
    notifyListeners();
  }

  void removeContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index, Contact contact) {
    _contactList[index] = contact;
    notifyListeners();
  }
}
