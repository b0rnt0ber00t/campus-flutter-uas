// ignore_for_file: file_names

import 'package:campus_flutter_uas/DbHelper.dart';
import 'package:campus_flutter_uas/models/item.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _CustomFormState();
}

enum GenderCharacter { l, p }

class _CustomFormState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nim = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();

  GenderCharacter? _genderCharacter = GenderCharacter.l;

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

              if (!RegExp(r"^[0-9]*$").hasMatch(value)) {
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
          Row(
            children: [
              const Text('Jenis Kelamin: '),
              Expanded(
                child: ListTile(
                  title: const Text('L'),
                  leading: Radio<GenderCharacter>(
                    value: GenderCharacter.l,
                    groupValue: _genderCharacter,
                    onChanged: (GenderCharacter? value) {
                      setState(() {
                        _genderCharacter = value;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('P'),
                  leading: Radio<GenderCharacter>(
                    value: GenderCharacter.p,
                    groupValue: _genderCharacter,
                    onChanged: (GenderCharacter? value) {
                      setState(() {
                        _genderCharacter = value;
                      });
                    },
                  ),
                ),
              ),
            ],
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

                  var gender =
                      _genderCharacter.toString() == 'GenderCharacter.l'
                          ? 'l'
                          : 'p';

                  DBHelper.createItem(
                      int.parse(_nim.text), _name.text, _address.text, gender);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Success')),
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
