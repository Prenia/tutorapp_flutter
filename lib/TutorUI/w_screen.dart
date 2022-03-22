import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class WScreen extends StatefulWidget {
  const WScreen({Key? key}) : super(key: key);

  @override
  _WScreenState createState() => _WScreenState();
}

class _WScreenState extends State<WScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }
  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser;
      if(user != null){
        loggedInUser = user;
      }
    } catch (e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 60.0,
                ),
                const Text(
                  '  Welcome Tutor',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, '/logscreen');
                  },
                  minWidth: 150.0,
                  height: 22.0,
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, '/regscreen');
                  },
                  minWidth: 150.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
