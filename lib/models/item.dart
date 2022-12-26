// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

class Item {
  late int? _nim;
  late String? _nama;
  late String? _alamat;
  late String? _jenisKelamin;

  // get nim => _nim;
  // get nama => _nama;
  // get alamat => _alamat;
  // get jenisKelamin => _jenisKelamin;

  set nim(int value) => _nim = value;
  set nama(String value) => _nama = value;
  set alamat(String value) => _alamat = value;
  set jenisKelamin(String value) => _jenisKelamin = value;

//construktor versi 1
  Item(this._nim, this._nama, this._alamat, this._jenisKelamin);

  Item.fromMap(Map<String, dynamic> map) {
    _nim = map['nim'];
    _nama = map['nama'];
    _alamat = map['alamat'];
    _jenisKelamin = map['jenisKelamin'];
  }

// konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['nim'] = _nim;
    map['nama'] = _nama;
    map['alamat'] = _alamat;
    map['jenisKelamin'] = _jenisKelamin;
    return map;
  }
}
