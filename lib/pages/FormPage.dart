// ignore_for_file: file_names

import 'dart:ffi';

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  CustomFormState createState() => CustomFormState();
}

enum SingingCharacter { l, p }

class CustomFormState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nim = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();
  SingingCharacter? _gender = SingingCharacter.l;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'NIM: ',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid nim';
              }
              return null;
            },
            controller: _nim,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nama: ',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid name';
              }
              return null;
            },
            controller: _name,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Alamat: ',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid address';
              }
              return null;
            },
            controller: _address,
          ),
          const SizedBox(height: 20),
          const Text('Jenis Kelamin'),
          ListTile(
            title: const Text('L'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.l,
              groupValue: _gender,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('P'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.p,
              groupValue: _gender,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
