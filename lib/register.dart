
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:projectpp/otp.dart';


class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {

PhoneNumber number = PhoneNumber();

var phonenew; bool check ;
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       
       fit:StackFit.expand,
     children: <Widget>[

  Container(
     decoration: BoxDecoration(
              color: Color(0xffffffff)
  ),),

  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
       child: Text("OTP Verification" ,style:  GoogleFonts.poppins(
    fontSize: 35,
    color: Colors.black,
    fontWeight: FontWeight.bold
  ),),
     ),
    Container(
     padding: EdgeInsets.symmetric(horizontal : 30 ,),
     child: Text("We will send you  OTP to this mobile number" , style:GoogleFonts.nunito(
       color: Colors.black,
       fontSize: 12
     ),)
    ),
    SizedBox(height:10),

     Container(
        padding: new EdgeInsets.symmetric(horizontal:50 ,vertical: 2),

        child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
              phonenew= number.phoneNumber;
            },
            onInputValidated: (bool value) {
              check = value;
              print(value);
            },
            selectorConfig: SelectorConfig(
           backgroundColor: Colors.blueGrey,
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: phoneController,
            formatInput: false,
            keyboardType: TextInputType.numberWithOptions(),
            inputDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
                   borderRadius: BorderRadius.circular(50),
            ) ,
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
             borderRadius: BorderRadius.circular(50),
            ),),
            
            
          ),
 
  ),
  SizedBox(height:20),
   Container(
     // ignore: deprecated_member_use
     child: RaisedButton(onPressed: ()async {
       if (phonenew!=null && phonenew.length > 5 && check==true) {
        print(phonenew);

        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => OtpScreen(phonenew: phonenew,) )
        );
       
      }
        else {
          showToast();}
               } ,
               child: Text("Get Otp", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
               color: Color(0xff003566),
               ) ),
            ], ) ],
               ) ,
              );
            }
  void showToast() {
              Fluttertoast.showToast(
        msg: "Enter Valid Phone Number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1
    );
            }
  }