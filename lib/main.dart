import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final _data = const [
  //   {
  //     'name': 'Tambak1',
  //     'suhu': 25,
  //     'ph': 0,
  //     'salinitas': 20,
  //     'kesadahan': 30,
  //     'feeder': 60,
  //   },
  //   {
  //     'name': 'Tambak2',
  //     'suhu': 24,
  //     'ph': 1,
  //     'salinitas': 22,
  //     'kesadahan': 36,
  //     'feeder': 50,
  //   },
  //   {
  //     'name': 'Tambak3',
  //     'suhu': 22,
  //     'ph': 6,
  //     'salinitas': 15,
  //     'kesadahan': 64,
  //     'feeder': 45,
  //   },
  //   {
  //     'name': 'Tambak4',
  //     'suhu': 22,
  //     'ph': 2,
  //     'salinitas': 27,
  //     'kesadahan': 33,
  //     'feeder': 60,
  //   },
  //   {
  //     'name': 'Tambak5',
  //     'suhu': 23,
  //     'ph': 4,
  //     'salinitas': 20,
  //     'kesadahan': 30,
  //     'feeder': 30,
  //   },
  // ];

  List<String> tambak = [
    "tambak0",
    "tambak1",
    "tambak2",
    "tambak3",
    "tambak4",
    "tambak5",
    "tambak6",
    "tambak7",
    "tambak8",
    "tambak9"
  ];

  List<String> variable = ["suhu", "ph", "salinitas", "kesadahan"];

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
        length: tambak.length,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Fishmart',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottom: PreferredSize(
              child: TabBar(
                isScrollable: true,
                // indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                // unselectedLabelColor: Colors.white.withOpacity(0.3),
                // indicatorColor: Colors.white,
                tabs: List.generate(
                  tambak.length,
                  (index) {
                    return Tab(
                      child: Text(
                        tambak[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),
              preferredSize: Size.fromHeight(60.0),
            ),
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.add_alert),
              ),
            ],
          ),
          body: TabBarView(
            children: List.generate(
              tambak.length,
              (index) {
                return GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20),
                  shrinkWrap: true,
                  children: List.generate(
                    variable.length,
                    (i) {
                      return Card(
                        color: Colors.blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 64,
                              ),
                              Text(
                                "50°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                              Text(
                                variable[i],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
