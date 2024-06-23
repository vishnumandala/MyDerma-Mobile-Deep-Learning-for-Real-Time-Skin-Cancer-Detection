import 'package:MyDerma/Screens/login%20and%20homepage.dart';
import 'package:flutter/material.dart';
import 'package:MyDerma/Screens/imgpick.dart';
import 'package:MyDerma/Screens/appointments.dart';
import 'package:MyDerma/Screens/Offline.dart';
import 'package:MyDerma/Screens/modeofcontact.dart';
import 'package:MyDerma/Screens/Online_whatsapp.dart';
void main() {
    runApp(
      MaterialApp(
          initialRoute: '/login_and_home',
          routes: {
            '/login_and_home': (context) => login_and_home(),
            '/imagepicker':(context) => pick_image(),
            '/appointments':(context) => setappontment(),
            '/offline':(context) => OfflineAppointment(),
            '/modeofcontact':(context) => modeofcontact(),
            '/online_whatsapp':(context) => onlineWhatsapp(),
          }
      ),
    );
}