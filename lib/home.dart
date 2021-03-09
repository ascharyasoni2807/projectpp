import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectpp/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xff003566),
                          radius: 80,
                          child: Icon(
                            Icons.chat,
                            size: 50,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Text(
                          "Welcome To Chat App",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color:  Color(0xff003566),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Registeration()),
                  (route) => false);
                      },
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: Text("Next", style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
