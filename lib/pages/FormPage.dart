// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nim = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _gender = TextEditingController();

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
              hintText: 'Name: ',
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
              hintText: 'Address: ',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid address';
              }
              return null;
            },
            controller: _address,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Gender: ',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid gender';
              }
              return null;
            },
            controller: _gender,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
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
          ),
        ],
      ),
    );
  }
}
