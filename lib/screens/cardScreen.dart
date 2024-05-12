import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/ahmed.jpg'),
              ),
              Text(
                'ahmed ebbe',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ' FLUTTER  DEVELOPER',
                style: TextStyle(
                    fontFamily: 'Source Sans 3',
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal),
                    title: Text(
                      '+222 48709087',
                      style: TextStyle(
                          fontFamily: 'Source Sans 3',
                          color: Colors.teal.shade900,
                          fontSize: 20.0),
                    ),
                  )),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text(
                    'ahmedebbe@gmail.com',
                    style: TextStyle(
                        fontFamily: 'Source Sans 3',
                        color: Colors.teal.shade900,
                        fontSize: 20.0),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
