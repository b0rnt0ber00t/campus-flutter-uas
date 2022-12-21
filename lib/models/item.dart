import 'package:flutter/material.dart';

class Item {
  String _nim;
  String _nama;
  String _alamat;
  String _JenisKelamin;

  String get nim => this._nim;
  set nim(String value) => this._nim = value;

  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  String get alamat => this._alamat;
  set alamat(String value) => this._alamat = value;

  String get JenisKelamin => this._JenisKelamin;
  set jenisKelamin(String value) => this._JenisKelamin = value;

//construktor versi 1
  Item(this._nim, this._nama, this._alamat, this._JenisKelamin);

// konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['nim'] = this._nim;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['JenisKelamin'] = JenisKelamin;
    return map;
  }
}
