import 'package:flutter/material.dart';

import 'GetProfile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(doc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
     body: GetProfile(context),
    );
  }
}
