// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:campus_flutter_uas/DbHelper.dart';

class Edit extends StatefulWidget {
  final int nim;
  final String nama;
  final String alamat;
  final String jeniskelamin;

  const Edit({
    super.key,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.jeniskelamin,
  });

  @override
  // ignore: no_logic_in_create_state
  State<Edit> createState() => _EditPage(nim, nama, alamat, jeniskelamin);
}

enum GenderCharacter { l, p }

class _EditPage extends State<Edit> {
  final _formKey = GlobalKey<FormState>();

  final _nim = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();

  GenderCharacter? _genderCharacter = GenderCharacter.l;

  _EditPage(int nim, String nama, String alamat, String jeniskelamin) {
    _nim.text = nim.toString();
    _name.text = nama.toString();
    _address.text = alamat.toString();
    _genderCharacter = jeniskelamin.toString() == 'Laki-laki'
        ? GenderCharacter.l
        : GenderCharacter.p;
  }

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
