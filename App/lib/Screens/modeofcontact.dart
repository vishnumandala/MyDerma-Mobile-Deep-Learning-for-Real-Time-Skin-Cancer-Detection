import 'package:flutter/material.dart';

import '../utils.dart';

class modeofcontact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff81c2d6),Color(0xffcf484c)], // Define your gradient colors
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          title: Text("Mode Of Contact",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Color(0xff3EEBB4),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Select A Mode Of Contact",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                SizedBox(height: 200,),
                Container(
                  child: Text("You Can Contact The Available Doctors",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  height: MediaQuery.of(context).size.height*0.06,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Color(0xff3EEBB4)),
                      side: MaterialStateProperty.all(BorderSide(color: Color(0xff3EEBB4))),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/online_whatsapp");
                    },
                    child: Text("Whatsapp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  )
                  ,
                ),
                SizedBox(height: 250,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
