import 'package:flutter/material.dart';

import 'Edit.dart';

class DetailPage extends StatelessWidget {
  final int id;
  final int nim;
  final String nama;
  final String alamat;
  final String jeniskelamin;

  static const appTitle = 'Home';

  const DetailPage({
    super.key,
    required this.id,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.jeniskelamin,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              // margin: const EdgeInsets.only(left: 135, right: 100, top: 80),
              child: Icon(
                Icons.person,
                size: 150,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  nim.toString(),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(nama),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(alamat),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              // margin: const EdgeInsets.only(left: 135, right: 100, top: 20),
              child: Text(jeniskelamin.toString()),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // validate nim}
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Edit(
                        id: id,
                        nim: nim,
                        nama: nama,
                        alamat: alamat,
                        jeniskelamin: jeniskelamin,
                      ),
                    ),
                  );
                },
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );

    // TODO: implement build
  }
}
