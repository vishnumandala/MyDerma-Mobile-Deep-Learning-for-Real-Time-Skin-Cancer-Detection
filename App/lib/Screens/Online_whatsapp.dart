import 'package:flutter/material.dart';
import 'package:MyDerma/utils.dart';
import 'package:flutter_plugin_openwhatsapp/flutter_plugin_openwhatsapp.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
class onlineWhatsapp extends StatefulWidget {
  @override
  _onlineWhatsappState createState() => _onlineWhatsappState();
}

class _onlineWhatsappState extends State<onlineWhatsapp> {

  String _message="";
  bool isButtonEnabled=false;

  Widget _specialistsCardInfo({String? type,String? name, String? address,String? number}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(USER_IMAGE),
                radius: 16.0,
              ),
              SizedBox(
                width: 30.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '$type\n',
                      style: TextStyle(
                        color: Color(0xff3EEBB4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "\n$address",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FlutterPluginOpenwhatsapp whatsapp =FlutterPluginOpenwhatsapp();
                      String? result = await whatsapp.openWhatsApp(phoneNumber: "$number", text: "$_message");
                      print(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3EEBB4), // Background color
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      minimumSize: Size(99, 36), // min sizes for Material buttons
                    ),
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )
                  ,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _areaSpecialistsText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              'Available Specialists',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          flexibleSpace:  Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff81c2d6),Color(0xffcf484c)], // Define your gradient colors
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          title: const Text('Contact : Whatsapp',style: TextStyle(color: Colors.black),),
          backgroundColor: Color(0xff3EEBB4),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Center(
                child: Column(
                  children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     child: TextFormField(
                       key: formKey,
                       onChanged: (val){
                         setState(() {
                           isButtonEnabled=true;
                           _message=val;
                         });
                       },
                       maxLines: 10,
                       decoration: InputDecoration(
                           hintText: 'Enter Message And Select The Doctor Of Your Choice',
                         border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff3EEBB4)),
                             borderRadius: BorderRadius.circular(20.0))
                       ),
                     ),
                   ),
                    _areaSpecialistsText(),
                      Column(
                        children: [
                          _specialistsCardInfo(name:"George Zaki",type: "Oncologist", address: "College Park,Maryland",number:"12409604450"),
                          _specialistsCardInfo(name:"Datta Lohith G",type: "Oncologist", address: "College Park,Maryland",number:"12409604450"),
                          _specialistsCardInfo(name:"Vishnu Mandala",type: "Oncologist", address: "College Park,Maryland",number:"12409604450"),
                          _specialistsCardInfo(name:"Charan Kasturi",type: "Oncologist", address: "College Park,Maryland",number:"12409604450"),
                          _specialistsCardInfo(name:"Aashritha",type: "Oncologist", address: "College Park,Maryland",number:"12409604450"),
                        ],
                      ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}