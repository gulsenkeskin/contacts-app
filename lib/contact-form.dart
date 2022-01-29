import 'package:flutter/material.dart';

import 'models/contact.dart';

class ContactForm extends StatefulWidget {
  static const route = '/contact_form';
  final int index;
  final Contact contact;

  const ContactForm({Key? key, required this.index, required this.contact})
      : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String imageUrl = 'https://picsum.photos/100';
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _lNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
