import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
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
    "Tambak Udang",
    "Tambak Lele",
    "Tambak Nila",
    "Tambak Patin"
  ];

  List<String> variable = ["Suhu", "pH", "Salinitas", "Kesadahan"];

  Color card_color = Colors.blue;
  Color splash_color = Colors.blue;

  String unit = "";
  String value = "";
  double val = 0;
  bool alert = false;

  var rng = Random();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tambak.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
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
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: Icon(
                  Icons.add_location_alt_rounded,
                ),
                iconSize: 26,
                onPressed: () {},
              ),
            )
          ],
        ),
        body: TabBarView(
          children: List.generate(
            tambak.length,
            (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(20),
                    children: List.generate(
                      variable.length,
                      (i) {
                        alert = false;
                        if (i == 0) {
                          card_color = Colors.lightBlue;
                          splash_color = Colors.blue.shade800;
                          val = rng.nextInt(10) + 20;
                          if (val < 20 || val > 30) alert = true;
                          value = val.toInt().toString();
                          unit = "°C";
                        } else if (i == 1) {
                          card_color = Colors.purple.shade400;
                          splash_color = Colors.deepPurple;
                          val = rng.nextInt(26) / 10 + 6.7;
                          if (val < 7.2 || val > 8.8) alert = true;
                          value = val.toStringAsFixed(1);
                          unit = "";
                        } else if (i == 2) {
                          card_color = Colors.amber;
                          splash_color = Colors.deepOrange;
                          val = rng.nextInt(25) + 10;
                          if (val < 15 || val > 25) alert = true;
                          value = val.toInt().toString();
                          unit = "‰";
                        } else if (i == 3) {
                          card_color = Colors.lightGreen;
                          splash_color = Colors.teal;
                          val = rng.nextInt(30) + 105;
                          if (val < 110 || val > 130) alert = true;
                          value = val.toInt().toString();
                          unit = " mg/L";
                        }
                        return Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Card(
                                color: card_color,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  splashColor: splash_color,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SvgPicture.asset(
                                          'assets/' + variable[i] + '.svg',
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        value + unit,
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
                              ),
                            ),
                            alert == true
                                ? Positioned(
                                    right: 0,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.red,
                                      ),
                                      constraints: BoxConstraints(
                                        minHeight: 16,
                                        minWidth: 16,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Card(
                      color: Colors.red[400],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        splashColor: Colors.red[700],
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/Feed.svg',
                              height: 50,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "09:00",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "dan",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "15:00",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Automatic Feeder',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
