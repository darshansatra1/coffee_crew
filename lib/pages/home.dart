import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bg = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDaytime': result['isDaytime']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[200],
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
