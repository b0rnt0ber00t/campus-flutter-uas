// ignore_for_file: file_names

import 'dart:io';

import 'package:campus_flutter_uas/DbHelper.dart';
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _nim,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "NIM",
                labelText: 'NIM',
                icon: const Icon(Icons.assignment),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _name,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Nama",
                labelText: 'Nama',
                icon: const Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _address,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Alamat",
                labelText: 'Alamat',
                icon: const Icon(Icons.location_city),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
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
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // validate nim
                if (_nim.text.isEmpty ||
                    !RegExp(r"^[0-9]*$").hasMatch(_nim.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid nim')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  var gender =
                      _genderCharacter.toString() == 'GenderCharacter.l'
                          ? 'l'
                          : 'p';

                  DbHelper.createItem(
                    int.parse(_nim.text),
                    _name.text,
                    _address.text,
                    gender,
                  );

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
