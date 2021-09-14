import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _data = const [
    {
      'name': 'Tambak1',
      'suhu': 25,
      'ph': 0,
      'salinitas': 20,
      'kesadahan': 30,
      'feeder': 60,
    },
    {
      'name': 'Tambak2',
      'suhu': 24,
      'ph': 1,
      'salinitas': 22,
      'kesadahan': 36,
      'feeder': 50,
    },
    {
      'name': 'Tambak3',
      'suhu': 22,
      'ph': 6,
      'salinitas': 15,
      'kesadahan': 64,
      'feeder': 45,
    },
    {
      'name': 'Tambak4',
      'suhu': 22,
      'ph': 2,
      'salinitas': 27,
      'kesadahan': 33,
      'feeder': 60,
    },
    {
      'name': 'Tambak5',
      'suhu': 23,
      'ph': 4,
      'salinitas': 20,
      'kesadahan': 30,
      'feeder': 30,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //dont forget to set false, before deploy
      debugShowCheckedModeBanner: true,
      title: "Fishmart",
      theme: ThemeData(
          // brightness: Brightness.dark,
          ),
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            title: const Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Fishmart',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottom: PreferredSize(
              child: const TabBar(
                isScrollable: true,
                // indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                // unselectedLabelColor: Colors.white.withOpacity(0.3),
                // indicatorColor: Colors.white,
                tabs: [
                  Tab(text: "Tambak1"),
                  Tab(text: "Tambak2"),
                  Tab(text: "Tambak3"),
                  Tab(text: "Tambak4"),
                  Tab(text: "Tambak5"),
                  Tab(text: "Tambak6"),
                  Tab(text: "Tambak7"),
                  Tab(text: "Tambak8"),
                  Tab(text: "Tambak9"),
                ],
              ),
              preferredSize: Size.fromHeight(60.0),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.add_alert),
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('one')),
              Center(child: Text('two')),
              Center(child: Text('three')),
              Center(child: Text('one')),
              Center(child: Text('two')),
              Center(child: Text('three')),
              Center(child: Text('one')),
              Center(child: Text('two')),
              Center(child: Text('three')),
            ],
          ),
        ),
      ),
    );
  }
}
