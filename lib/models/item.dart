// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

class Item {
  String _nim;
  String _nama;
  String _alamat;
  String _JenisKelamin;

  String get nim => _nim;
  set nim(String value) => _nim = value;

  String get nama => _nama;
  set nama(String value) => _nama = value;

  String get alamat => _alamat;
  set alamat(String value) => _alamat = value;

  String get JenisKelamin => _JenisKelamin;
  set jenisKelamin(String value) => _JenisKelamin = value;

//construktor versi 1
  Item(this._nim, this._nama, this._alamat, this._JenisKelamin);

// konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['nim'] = _nim;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['JenisKelamin'] = JenisKelamin;
    return map;
  }
}
