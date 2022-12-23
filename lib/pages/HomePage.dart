// ignore_for_file: file_names

import 'package:campus_flutter_uas/pages/FormPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.article),
                child: Text('Isi Data'),
              ),
              Tab(
                icon: Icon(Icons.list),
                child: Text('List Data'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            FormPage(),
            Center(
              child: Text('tab two'),
            ),
          ],
        ),
      ),
    );
  }
}
