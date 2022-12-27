// ignore_for_file: non_constant_identifier_names, file_names

import 'package:campus_flutter_uas/models/item.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE biodata(
        nim INTEGER PRIMARY KEY NOT NULL,
        nama text,
        alamat TEXT,
        jenisKelamin TEXT, 
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  // create database
  static Future<Database> db() async {
    return openDatabase(
      'biodata.db',
      version: 1,
      onCreate: (
        Database database,
        int version,
      ) async {
        await createTables(database);
      },
    );
  }

  // create new data ( insert ) ( bio )
  static Future<int> createItem(
    int nim,
    String nama,
    String alamat,
    String jenisKelamin,
  ) async {
    final db = await DbHelper.db();

    final data = {
      'nim': nim,
      'nama': nama,
      'alamat': alamat,
      'jenisKelamin': jenisKelamin
    };

    return await db.insert(
      'biodata',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // read data ( select ) ( bio )
  // static Future<List<Map<String, Object?>>> getItems() async {
  static Future<List<Item>> getItems() async {
    final db = await DbHelper.db();
    final mapList = await db.query('biodata', orderBy: "nim");
    int count = mapList.length;
    List<Item> itemList = <Item>[];

    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(mapList[i]));
    }

    return itemList;
  }

  // static Future<List<Item>> getItems() async {
  //   final db = await DbHelper.db();
  //   final mapList = await db.query(table)
  // }

  // read single data ( IMPORTANTE )
  static Future<List<Map<String, dynamic>>> getItem(int nim) async {
    final db = await DbHelper.db();
    return db.query('biodata', where: "nim = ?", whereArgs: [nim], limit: 1);
  }

  // update data ( update ) ( bio )
  static Future<int> updateItem(
    int nim,
    String nama,
    String alamat,
    String jenisKelamin,
  ) async {
    final db = await DbHelper.db();

    final data = {
      'nim': nim,
      'nama': nama,
      'alamat': alamat,
      'jenisKelamin': jenisKelamin
    };

    return await db.update('biodata', data, where: "nim = ?", whereArgs: [nim]);
  }

  // delete data ( delete ) ( bio )
  static Future<void> deleteItem(int nim) async {
    final db = await DbHelper.db();
    try {
      await db.delete("biodata", where: "nim = ?", whereArgs: [nim]);
    } catch (err) {
      debugPrint("Cannot delete bio: $err");
    }
  }
}
