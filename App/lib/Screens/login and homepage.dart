
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login_and_home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login_and_homeState();
  }
}

class _login_and_homeState extends State<login_and_home> {
  bool _isLoggedIn = false;

  // GoogleSignIn? _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    setState(() {
      _isLoggedIn = true;
      _idimage=1;
    });
    print("Logged in");
  }

  _logout(){
    // _googleSignIn!.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }


  int _idimage=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: _isLoggedIn && _idimage==1
                ? SafeArea(
          child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:28.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage(
                            'assets/images/myDerma title.png',),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width*0.6,
                              height: MediaQuery.of(context).size.height*0.06,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                height: MediaQuery.of(context).size.height*0.06,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5), // Shadow color
                                        spreadRadius: 5, // Spread radius
                                        blurRadius: 7, // Blur radius
                                        offset: Offset(0, 3), // Offset in the positive direction of y-axis
                                      ),
                                    ],
                                  ),
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Colors.black87),
                                      backgroundColor: MaterialStateProperty.all(Color(0xff81c2d6)),
                                      side: MaterialStateProperty.all(BorderSide(color: Color(0xff81c2d6),width:2.0)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/imagepicker");
                                    },
                                    child: Text("Take A Test", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.6,
                              height: MediaQuery.of(context).size.height*0.06,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Shadow color
                                      spreadRadius: 5, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: Offset(0, 3), // Offset in the positive direction of y-axis
                                    ),
                                  ],
                                ),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(Colors.black87), // Text color
                                    backgroundColor: MaterialStateProperty.all(Color(0xff81c2d6)), // Background color
                                    side: MaterialStateProperty.all(BorderSide(color: Color(0xff81c2d6), width: 2.0)), // Border color and width
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/appointments");
                                  },
                                  child: Text(
                                    "Appointments",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height: MediaQuery.of(context).size.height*0.06,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Shadow color
                                      spreadRadius: 5, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: Offset(0, 3), // Offset in the positive direction of y-axis
                                    ),
                                  ],
                                ),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                                    backgroundColor: MaterialStateProperty.all(Color(0xffcf484c)), // Background color
                                    side: MaterialStateProperty.all(BorderSide(color: Color(0xffcf484c), width: 2.0)), // Border color and width
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  },
                                  child: Text(
                                    "Exit App",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Poppins-Medium'),
                                  ),
                                ),
                              ),
                              ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
                : SafeArea(
                  child: Scaffold(
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:28.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.5,
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/myDerma title.png',),
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.06,
                              child: Text("Skin Cancer Detection App",style: TextStyle(fontSize: 22,color: Colors.grey[500],fontFamily: "custom"),),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width,
                              child: OutlinedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white), // Background color
                                  overlayColor: MaterialStateProperty.all(Color(0xff3EEBB4)), // Splash color
                                  side: MaterialStateProperty.all(BorderSide(color: Color(0x003EEBB4))), // Border color
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Border radius
                                  ),
                                ),
                                onPressed: () {
                                  _login();
                                },
                                child: Container(
                                  // height: 30,
                                  child: Transform.scale(
                                    scale: 4.0, // Adjust the scale factor as needed
                                    child: Image(
                                      image: AssetImage("assets/images/start.png"),
                                    ),
                                  ),
                                )

                              )
                              ,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }


//   Container _backBgCover() {
//     return Container(
//       height: 290,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Color(0xff3EEBB4), Color(0xff30AFE4)]),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(100),
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//     );
//   }
//
//   Positioned _greetings() {
//     return Positioned(
//       left: 20,
//       bottom: 90,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           CircleAvatar(
//             backgroundImage: NetworkImage(_googleSignIn!.currentUser!.photoUrl!),
//             radius: 40,
//           ),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 _googleSignIn!.currentUser!.displayName!,
//                 style: TextStyle(
//                   fontSize: 36,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(width: 25,),
//             ],
//           ),
//           Text(
//             'How are you feeling today ?',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w300,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}

