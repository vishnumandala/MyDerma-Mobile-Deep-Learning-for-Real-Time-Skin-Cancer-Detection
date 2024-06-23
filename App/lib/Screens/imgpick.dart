import 'package:MyDerma/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite_flutter_plus/tflite_flutter_plus.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:logger/logger.dart';
import 'package:MyDerma/Screens/classifier1.dart';
import 'package:MyDerma/Screens/classifier2.dart';
import 'package:MyDerma/Screens/classifier3.dart';
import 'package:MyDerma/Screens/float1.dart';
import 'package:MyDerma/Screens/float2.dart';
import 'package:MyDerma/Screens/float3.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart' as helpertf;
import 'package:image/image.dart' as img;
bool getresult=false;
class pick_image extends StatefulWidget {
  @override
  _pick_imageState createState() => _pick_imageState();
}
bool _formfilled=false;
bool imagepicked=false;
int flag=100000;
class _pick_imageState extends State<pick_image> {
  bool isloading=false;
  File? _image;
  String path=" ";
  final picker = ImagePicker();
  @override
  void initState(){
    super.initState();
    setState(() {
      _formfilled=false;
      imagepicked=false;
    });
  }

  Widget Load(){
    return Column(
      children: [
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff3EEBB4)),
        ),
        SizedBox(height: 30,),
        Text("Tap On Show Results ",style: TextStyle(fontSize: 20),)
      ],
    );
  }

  getImagecamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(
        _image!,
      );
    });
  }


  Future getImagegallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(
        _image!,
      );
    });
  }


  Widget _getFAB() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom:18.0),
        child: SpeedDial(
          elevation: 12,
          animatedIcon: AnimatedIcons.view_list,
          animatedIconTheme: IconThemeData(size: 22),
          backgroundColor: Color(0xff3EEBB4),
          visible: true,
          curve: Curves.bounceIn,
          children: [
            // FAB 1
            SpeedDialChild(
                child: Icon(Icons.camera),
                backgroundColor: Color(0xff3EEBB4),
                onTap: getImagecamera,
                label: 'Use Camera',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xff3EEBB4)),
            // FAB 2
            SpeedDialChild(
                child: Icon(Icons.photo_size_select_actual),
                backgroundColor: Color(0xff3EEBB4),
                onTap: getImagegallery,
                label: 'Pick From Gallery',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xff3EEBB4))
          ],
        ),
      ),
    );
  }

  bool _selectedyes=false;
  bool _selectedno=false;

  Widget buildChips(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          child: FilterChip(
              selected: _selectedyes,
              label: Text('Yes',style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.grey[200],
              selectedColor: Colors.greenAccent,
              onSelected: (bool selected) {
                setState(() {
                  _selectedyes = true;
                  _selectedno= false;
                });
              }
          ),
        ),
        Container(
          width: 100,
          child: FilterChip(
              selected: _selectedno,
              label: Text('No',style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.grey[200],
              selectedColor: Colors.greenAccent,
              onSelected: (bool selected) {
                setState(() {
                  _selectedyes = false;
                  _selectedno = true;
                });
              }
          ),
        ),
      ],
    );
  }

  Widget modelform(){
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
          title: Text("Model Form",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Color(0xff3EEBB4),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                        "To help you identify characteristics of unusual moles that may indicate melanoma or other skin cancers, think of the letters ABCDE:-",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 30,),
                  Container(
                    child: Text(
                      "A. Is for asymmetrical shape. Look for moles with irregular shapes, such as two very different-looking halves.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "B. Is for irregular border. Look for moles with irregular, notched or scalloped borders — characteristics of melanoma.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "C. Is for changes in color. Look for growths that have many colors or an uneven distribution of color.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "D. Is for diameter. Look for new growth in a mole larger than 1/4 inch (about 6 millimeters).",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "E. Is for evolving. Look for changes over time, such as a mole that grows in size or that changes color or shape. Moles may also evolve to develop new signs and symptoms, such as new itchiness or bleeding.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 40,),
                  buildChips(),
                  SizedBox(height: 60,),
                  _selectedyes || _selectedno ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.05,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white), // Background color
                            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                            overlayColor: MaterialStateProperty.all(Color(0xff3EEBB4)), // Splash color
                            side: MaterialStateProperty.all(BorderSide(
                              color: Color(0xff3EEBB4), // Border color
                            )),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Border radius
                            )),
                          ),
                          onPressed: () {
                            if(_selectedyes == true) {
                              _classifier3 = ClassifierFloat3(numThreads: 1);
                              _classifier2 = ClassifierFloat2(numThreads: 1);
                              print(flag);
                            } else if(_selectedno == true) {
                              _classifier1 = ClassifierFloat1(numThreads: 1);
                              print(flag);
                            } else {
                              print("Select One Of The Two Options");
                            }
                            setState(() {
                              _formfilled = true;
                            });
                          },
                          child: Text("Submit"),
                        )
                        ,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.05,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                            overlayColor: MaterialStateProperty.all(Color(0xff3EEBB4)), // Splash color
                            side: MaterialStateProperty.all(BorderSide(color: Color(0xff3EEBB4))), // Border color
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Border radius
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedyes = false;
                              _selectedno = false;
                            });
                          },
                          child: Text("Reset"),
                        )
                        ,
                      )
                    ],
                  ): Container(child: Text("Answer Is Required",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),),//else
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Classifier1? _classifier1;
  Classifier2? _classifier2;
  Classifier3? _classifier3;
  var logger = Logger();
  Image? _imageWidget;
  img.Image? fox;
  helpertf.Category? category1;
  helpertf.Category? category2;
  helpertf.Category? category3;

  // void _predict1() async {
  //   print("Prediction 1 Running....");
  //   img.Image? imageInput = img.decodeImage(_image!.readAsBytesSync());
  //   var pred = _classifier1!.predict(imageInput!);
  //
  //   setState(() {
  //     this.category1 = pred;
  //     isloading=false;
  //   });
  // }

  void _predict2() async {
    print("Prediction 2 Running....");
    img.Image? imageInput = img.decodeImage(_image!.readAsBytesSync());
    var pred = _classifier2!.predict(imageInput!);

    setState(() {
      this.category2 = pred;
      isloading=false;
    });
  }

  // void _predict3() async {
  //   print("Prediction 3 Running....");
  //   img.Image? imageInput = img.decodeImage(_image!.readAsBytesSync());
  //   var pred = _classifier3!.predict(imageInput!);
  //
  //   setState(() {
  //     this.category3 = pred;
  //     isloading=false;
  //   });
  // }

  Widget pickimagehere(){
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        title: Text('Upload An Image', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Color(0xff3EEBB4),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
                child: _image == null
                    ?
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text('Provide A Clear Picture Of The Infection',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ):
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        child: Image.file(_image!,fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        isloading ? Load():
                        _selectedyes ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                    category2 != null? "Cancer Model : "+category2!.label : 'Results Will Be Displayed Here....',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    category2 != null ? 'Cancer Confidence : ${(1-category2!.score).toStringAsFixed(3)}': '',
                                    style: TextStyle(fontSize: 16),textAlign: TextAlign.center,
                                  )


                            // category3!.label=="Melanoma"?
                            // Column(
                            //   children: [
                            //     Text(
                            //       category3 != null? "Melanoma Model : "+category3!.label : 'Results Will Be Displayed Here....',
                            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            //     ),
                            //     Text(
                            //       category3 != null ? 'Melanoma Confidence : ${category3!.score.toStringAsFixed(3)}': '',
                            //       style: TextStyle(fontSize: 16),textAlign: TextAlign.center,
                            //     ),
                            //   ],
                            // ):
                            // Column(
                            //   children: [
                            //     Text(
                            //       category2 != null? "Cancer Model : "+category2!.label : 'Results Will Be Displayed Here....',
                            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            //     ),
                            //     Text(
                            //       category2 != null ? 'Cancer Confidence : ${category2!.score.toStringAsFixed(3)}': '',
                            //       style: TextStyle(fontSize: 16),textAlign: TextAlign.center,
                            //     ),
                            //   ],
                            // )
                          ],
                        ) :
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              category1 != null? "It might be a scar or a minor rash! Consult a doctor for better advice.":'Results Will Be Displayed Here....',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                            ),
                          ),
                        ],),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                            backgroundColor: MaterialStateProperty.all(Color(0xff3EEBB4)), // Splash color
                            side: MaterialStateProperty.all(BorderSide(color: Color(0xff3EEBB4))), // Border color
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Border radius
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isloading = true;
                              getresult = true;
                            });
                            if (_selectedyes) {
                              // _predict3();
                              _predict2();
                            } else {
                              // _predict1();
                              print("Allergy or Rash");
                            }
                          },
                          child: Text("Get Results"),
                        )
                        ,
                        SizedBox(width: 25,),
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                            backgroundColor: MaterialStateProperty.all(Color(0xccd2464a)), // Splash color
                            side: MaterialStateProperty.all(BorderSide(color: Color(0xccd2464a))), // Border color
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Border radius
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _image = null;
                              this.category1 = null;
                              this.category2 = null;
                              this.category3 = null;
                              isloading = false;
                              getresult = false;
                            });
                          },
                          child: Text("Reset"),
                        )
                        ,
                      ],
                    ),
                    SizedBox(height: 15,),
                    getresult ?
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                        backgroundColor: MaterialStateProperty.all(Color(0xff81c2d6)), // Splash color
                        side: MaterialStateProperty.all(BorderSide(color: Color(0xff81c2d6))), // Border color
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Border radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/appointments");
                      },
                      child: Text("Go To Appointments"),
                    )
                        : Container(child: Text("Generate Result to Set Appointment"),)
                  ],
                )
            ),
            SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
      floatingActionButton: _getFAB()
    );
  }

  @override
  void dispose() {
    // Interpreter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _formfilled ? pickimagehere() : modelform(),
      ),
    );
  }
}

