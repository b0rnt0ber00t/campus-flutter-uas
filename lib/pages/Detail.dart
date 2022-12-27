import 'package:campus_flutter_uas/models/item.dart';
import 'package:campus_flutter_uas/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:campus_flutter_uas/DbHelper.dart';
import 'package:campus_flutter_uas/pages/FormPage.dart';
import 'package:campus_flutter_uas/pages/ListItem.dart';
import 'package:sqflite/sqflite.dart';

class DetailPage extends StatelessWidget {
  final int nim;
  final String nama;
  final String alamat;
  final String jeniskelamin;

  static const appTitle = 'Home';

  const DetailPage(
      {super.key,
      required this.nim,
      required this.nama,
      required this.alamat,
      required this.jeniskelamin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 135, right: 100, top: 80),
              child: Icon(
                Icons.person,
                size: 150,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 135, right: 100, top: 20),
                child: Text(
                  nim.toString(),
                )),
            Container(
              margin: const EdgeInsets.only(left: 135, right: 100, top: 20),
              child: Text(nama),
            ),
            Container(
              margin: const EdgeInsets.only(left: 135, right: 100, top: 20),
              child: Text(alamat),
            ),
            Container(
              margin: const EdgeInsets.only(left: 135, right: 100, top: 20),
              child: Text(jeniskelamin.toString()),
            )
          ],
        ),
      ),
    );

    // TODO: implement build
  }
}
