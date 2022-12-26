import 'package:campus_flutter_uas/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:campus_flutter_uas/DbHelper.dart';
import 'package:campus_flutter_uas/pages/FormPage.dart';
import 'package:campus_flutter_uas/pages/ListItem.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

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
            ListItem(),
          ],
        ),
      ),
    );
  }
  Widget buttonElevated() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Back", style: TextStyle(fontSize: 20)),
    );
  }
}

// home: Scaffold(
//           body: Container(
//               child: ElevatedButton(
//             onPressed: () {},
//             child: Text("Back", style: TextStyle(fontSize: 20)),
//           ))),
//     );