import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);
    // set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    Color textColor = data['isDayTime'] ? Colors.grey[800] : Colors.white;
    Color buttonColor = data['isDayTime'] ? Colors.grey[900] : Colors.grey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: buttonColor,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: buttonColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: textColor,
                      ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
