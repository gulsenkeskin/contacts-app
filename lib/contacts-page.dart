import 'package:contacts_app/provider/contact-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact-card.dart';
import 'contact-form.dart';
import 'dummy-data.dart';
import 'models/contact.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  void _getContacts() async {
    await Future.delayed(Duration(milliseconds: 200));
    ContactProvider contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    contactProvider.contacts = dummyData;
  }

  void _updateContact(int index, Contact contact) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactForm(
          index: index,
          contact: contact,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getContacts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      backgroundColor: Color(0xFFFAFAFA),
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(context) {
    return Consumer<ContactProvider>(
      builder: (context, snapshot, child) {
        return ListView.builder(
          itemBuilder: (context, index) => ContactCard(
            index: index,
            contact: snapshot.contacts[index],
            updateCallback: _updateContact,
            deleteCallback: () => snapshot.removeContact(index),
          ),
          itemCount: snapshot.contacts.length,
        );
      },
    );
  }
}
