import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/TutorUI/getbookings.dart';

class TutorHome extends StatefulWidget {
  const TutorHome({Key? key}) : super(key: key);

  @override
  State<TutorHome> createState() => _TutorHomeState();
}

class _TutorHomeState extends State<TutorHome> {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_sharp, size: 30),
        title: const Text('Session Booking Requests'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          )
        ],
        backgroundColor: Colors.teal,
      ),

      body: GetBookings(context),
    );
  }
}
