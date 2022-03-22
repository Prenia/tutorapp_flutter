import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String email;
  late String password;
  late String mobilenumber;
  late final String uid;
  @override
  Widget build(BuildContext context) {

    CollectionReference StudentUser = FirebaseFirestore.instance.collection('StudentUser');

    Future<void> addStudentUser() {
      return StudentUser.doc(_auth.currentUser?.uid).set({
        'email' : email,
        'mobilenumber' : mobilenumber,
      })
          .then((value) => print('User added')).catchError((error) => print('Failed to add user: $error'));
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              '        Register',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                //Do something with the user input.
                mobilenumber = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your mobile number',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.orangeAccent,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    //Implement registration functionality.
                    //print(email);
                    //print(password);
                    try {
                      final newUser = await _auth
                          .createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(newUser != null){
                        addStudentUser();
                        Navigator.pushNamed(context, '/home');
                      }
                    } catch(e){
                      print(e);
                    }

                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
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
