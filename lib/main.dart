
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectpp/chats.dart';
import 'package:projectpp/home.dart';
import 'package:projectpp/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';



SharedPreferences localStorage;
void main() async {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CheckWhichpage());
}

class CheckWhichpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
   
    // initialRoute: '/',
    
    // routes: {
    //   '/': (context) => SplashScreen(),
    //    '/registration': (context) => Registeration(),
    //     //  '/otpscreen': (context) => OtpScreen(),
    //       // '/phoneScreen': (context) => Phonenumber(),
    // },
    home: localStorage!=null ? ChatList(): SplashScreen()  ,
    );
  }
}