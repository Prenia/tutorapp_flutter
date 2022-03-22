import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/TutorUI/log_screen.dart';
import 'package:myapp/TutorUI/reg_screen.dart';
import 'package:myapp/TutorUI/tutorhome.dart';
import 'package:myapp/TutorUI/w_screen.dart';
import 'package:myapp/StudentUI/card_expanded.dart';
import 'package:myapp/welcome_page.dart';
import 'package:myapp/StudentUI/welcome_screen.dart';
import 'package:myapp/StudentUI/login_screen.dart';
import 'package:myapp/StudentUI/registration_screen.dart';
import 'package:myapp/StudentUI/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(

      title: 'Find a Tutor App',

      initialRoute: '/welcome',

      routes: {
        '/welcome': (context) => const WelcomePage(),
        // When navigating to the "/" route, build the FirstScreen widget.
        '/screen': (context) => const WelcomeScreen(),
        '/wscreen': (context) => const WScreen(),
        '/login' : (context) => const LoginScreen(),
        '/logscreen': (context) => const LScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/regscreen': (context) => const RScreen(),
        '/home': (context) => const MyListView(),
        '/profile': (context) => ProfileScreen(FieldPath.documentId),
        '/tutorhome': (context) => const TutorHome(),
      },
    ),
  );
}
