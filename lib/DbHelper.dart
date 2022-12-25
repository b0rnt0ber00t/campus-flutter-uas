// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE biodata(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nim INTEGER,
        nama text,
        alamat TEXT,
        jenisKelamin TEXT, 
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  // create database
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'biodata.db',
      version: 1,
      onCreate: (
        sql.Database database,
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
    final db = await DBHelper.db();

    final data = {
      'nim': nim,
      'nama': nama,
      'alamat': alamat,
      'jenisKelamin': jenisKelamin
    };

    final id = await db.insert(
      'biodata',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  // read data ( select ) ( bio )
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('biodata', orderBy: "id");
  }

  // read single data ( IMPORTANTE )
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();
    return db.query('biodata', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // update data ( update ) ( bio )
  static Future<int> updateItem(
    int id,
    int nim,
    String nama,
    String alamat,
    String jenisKelamin,
  ) async {
    final db = await DBHelper.db();

    final data = {
      'nim': nim,
      'nama': nama,
      'alamat': alamat,
      'jenisKelamin': jenisKelamin
    };

    return await db.update('biodata', data, where: "id = ?", whereArgs: [id]);
  }

  // delete data ( delete ) ( bio )
  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();
    try {
      await db.delete("biodata", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Cannot delete bio: $err");
    }
  }

  static insert(item) {}
}
