import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

import 'package:projectpp/chats.dart';
import 'package:projectpp/models/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  String phonenew;
  OtpScreen({this.phonenew});


  @override
  _OtpScreenState createState() => _OtpScreenState();
}
SharedPreferences localStorage;
class _OtpScreenState extends State<OtpScreen> {
 String phonenumber;
 String uid;
 static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }




  var otp;
   String _verificationCode;

   TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Container(
  color: Color(0xffffffff),
  child:   Padding(
    padding: const EdgeInsets.symmetric(vertical:100),
    child:   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
         Container(
         child: Text("OTP Verification" ,style:  GoogleFonts.poppins(
      fontSize: 35,
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),),
       ),
        Container(
       padding: EdgeInsets.symmetric(horizontal : 30 ,),
       child: Text("Enter the Otp Sent to ${widget.phonenew}  " , style:GoogleFonts.nunito(
         color: Colors.black,
         fontSize: 12
       ),)
      ),
  
          Padding(
        padding: EdgeInsets.symmetric(horizontal:30),
            child: Container(
            child:PinEntryTextField(
              showFieldAsBox: true,
              isTextObscure: true,
              fields: 6,
              onSubmit: (text) {
                 otp = text.toString();

              },
            ),
            ),
          ),
  
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10),
            // ignore: deprecated_member_use
            child: RaisedButton(onPressed: ()async{
            print(otp); 
           try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: otp))
                      .then((value) async {
                        
                                       if (value.user.uid != null) {
                                          Map<String, String> userInfoMap = {
                              "uid" : value.user.uid,
                              "phoneNumber": value.user.phoneNumber
                                  };

                                  DatabaseMethods().uploadUserInfo(userInfoMap);
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => ChatList()),
                                                  (route) => false);
                                            }else{
                                               Fluttertoast.showToast(
                                          msg: "Enter Correct OTP",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1
                            );
                                            }
                                          });
                                        } catch (e) {
                                         
                                        }},
                                        child: Text("Submit",style: TextStyle(color: Colors.white),),
                                        color: Color(0xff003566),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),),
                            );
                           }
                  _verifyPhone() async {
                            print("oooooooooooooooooooooooooooooooooooooo");
                            print(widget.phonenew);
                            await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '${widget.phonenew}',
                                verificationCompleted: (PhoneAuthCredential credential) async {
                                  await FirebaseAuth.instance
                                      .signInWithCredential(credential)
                                      .then((value) async {
                                        print(value);
                                    if (value.user != null) {
                                  
                                     uid = value.user.uid;
                                     phonenumber = value.user.phoneNumber;
                                     
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => ChatList()),
                                          (route) => false);
                                    }
                                  });
                                },
                                verificationFailed: (FirebaseAuthException e) {
                                  print(e.message);
                                },
                                codeSent: (String verficationID, int resendToken) {
                                  setState(() {
                                    _verificationCode = verficationID;
                                  });
                                },
                                codeAutoRetrievalTimeout: (String verificationID) {
                                  setState(() {
                                    _verificationCode = verificationID;
                                  });
                                },
                                timeout: Duration(seconds:60));
                          }
                        
                        @override
                          void initState() {
                            // TODO: implement initState
                            super.initState();
                             _verifyPhone();
                          }
                        @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }


}