import 'package:campus_flutter_uas/models/item.dart';
import 'package:campus_flutter_uas/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:campus_flutter_uas/DbHelper.dart';
import 'package:campus_flutter_uas/pages/FormPage.dart';
import 'package:campus_flutter_uas/pages/ListItem.dart';
import 'package:sqflite/sqflite.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditPage();
}

enum GenderCharacter { l, p }

class _EditPage extends State<Edit> {
  final _formKey = GlobalKey<FormState>();

  final _nim = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();

  GenderCharacter? _genderCharacter = GenderCharacter.l;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edit Page"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
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
                          const SnackBar(
                              content: Text('Please enter valid nim')),
                        );
                      } else if (_name.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter valid name')),
                        );
                      } else if (_address.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter valid address')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        var gender =
                            _genderCharacter.toString() == 'GenderCharacter.l'
                                ? 'Laki-laki'
                                : 'Perempuan';

                        DbHelper.createItem(
                          int.parse(_nim.text),
                          _name.text,
                          _address.text,
                          gender,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success')),
                        );

                        _nim.text = '';
                        _name.text = '';
                        _address.text = '';
                      }
                    },
                    child: const Text('Save'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
