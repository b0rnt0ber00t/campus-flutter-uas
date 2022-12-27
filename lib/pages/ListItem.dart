// ignore_for_file: file_names, camel_case_types

import 'package:campus_flutter_uas/DbHelper.dart';
import 'package:campus_flutter_uas/models/item.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:campus_flutter_uas/pages/Detail.dart';

late List<Item> globItemList;

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _CustomListItem();
}

class _CustomListItem extends State<ListItem> {
  int count = 0;
  late List<Item> itemList;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: createListView(count: count),
          ),
        ],
      ),
    );
  }

  void updateListView() {
    Future<Database> dbFuture = DbHelper.db();
    dbFuture.then((database) {
      //todo
      Future<List<Item>> itemListFuture = DbHelper.getItems();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          globItemList = itemList;
          count = itemList.length;
        });
      });
    });
  }

  void navigateToDetailPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
  }

  createListView({required int count}) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              globItemList[index].nama.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              globItemList[index].nim.toString(),
            ),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () async {
                // TODO: Delete
                DbHelper.deleteItem(globItemList[index].nim);
                updateListView();
              },
            ),
            // TODO: Navigasi ke DetailPage
            onTap: () async {
              navigateToDetailPage(context);
            },
            // onTap: () async {
            //   var item = ;
            //   await navigateToDetailPage(context, globItemList[index]);
            //   TODO: Edit
            //   editItem(globItemList[index]);
            // },
          ),
        );
      },
    );
  }
}
