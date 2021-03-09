import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
    backgroundColor:  Color(0xff003566),
    title: Text('Chats'),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right:5),
        child: IconButton(icon: Icon(Icons.logout), onPressed : onPressed),
      ),
                // Container(
                //     padding: EdgeInsets.symmetric(horizontal: 10),
                //     child: IconButton(
                //       icon: Icon(Icons.exit_to_app),
                //       onPressed: () {
                //         // _authmethods.signOut();
                //         // Navigator.pushReplacement(context,
                //         //     MaterialPageRoute(builder: (context) => SignIn()));
                //       },
                //     ))
              ],
            ),
            body: Container(
            
              child: Column(
                // children: [chatRoomList()],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor:  Color(0xff003566),
              child: Icon(Icons.chat),
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Searchscreen()));
              },
            ),
          );
            }
          
            void onPressed() {
              print('stable');
  }
}

class Chatroomtile extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  Chatroomtile({this.userName, this.chatRoomId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(chatRoomId);
        print("innnnnnn");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => Chatscreen(chatRoomId)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              //
              height: 40,
              alignment: Alignment.center,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(40)),
              child: Text("${userName.substring(0, 1).toUpperCase()}",
                  style: GoogleFonts.hammersmithOne(
                      textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: 3,
                          fontSize: 18))),
            ),
            SizedBox(
              width: 8,
            ),
            Text(userName,
                style: GoogleFonts.hammersmithOne(
                    textStyle: TextStyle(
                        color: Colors.white, letterSpacing: 3, fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
