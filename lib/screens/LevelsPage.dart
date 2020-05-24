import 'package:flutter/material.dart';
import 'package:yazlab/components/Constants.dart';
import 'package:yazlab/screens/GamePage.dart';

class LevelsPage extends StatefulWidget {
  @override
  _LevelsPageState createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00adb5),
        title: Text("Levels"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 40, // add custom icons also
          ),
        ),
      ),
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Container(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(50),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              //EASY
              GestureDetector(
                onTap: () {
                  level = 1;
                  map = generateMap(getAllCoords(1));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[300]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 2;
                  map = generateMap(getAllCoords(2));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[300]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 3;
                  map = generateMap(getAllCoords(3));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[300]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 4;
                  map = generateMap(getAllCoords(4));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[300]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 5;
                  map = generateMap(getAllCoords(5));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[300]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),

              //MEDIUM
              GestureDetector(
                onTap: () {
                  level = 6;
                  map = generateMap(getAllCoords(6));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '6',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),

              GestureDetector(
                onTap: () {
                  level = 7;
                  map = generateMap(getAllCoords(7));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '7',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 8;
                  map = generateMap(getAllCoords(8));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '8',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 9;
                  map = generateMap(getAllCoords(9));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '9',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 10;
                  map = generateMap(getAllCoords(10));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '10',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),

              //HARD
              GestureDetector(
                onTap: () {
                  level = 11;
                  map = generateMap(getAllCoords(11));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[900]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '11',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 12;
                  map = generateMap(getAllCoords(12));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[900]),
                  height: 50,
                  child: const Center(
                      child: Text(
                        '12',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 13;
                  map = generateMap(getAllCoords(13));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[900]),
                  width: 100,
                  height: 50,
                  child: const Center(
                      child: Text(
                        '13',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 14;
                  map = generateMap(getAllCoords(14));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue[900],
                  ),
                  width: 100,
                  height: 50,
                  child: const Center(
                      child: Text(
                        '14',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  level = 15;
                  map = generateMap(getAllCoords(15));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue[900],
                  ),
                  width: 100,
                  height: 50,
                  child: const Center(
                      child: Text(
                        '15',
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}