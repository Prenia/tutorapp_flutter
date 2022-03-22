import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          const Text(
              '       Welcome',
            style: TextStyle(
              fontSize: 45,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 50,
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
                  Navigator.pushNamed(context, '/screen');
                },
                minWidth: 150.0,
                height: 22.0,
                child: const Text(
                  'Student',
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
                  Navigator.pushNamed(context, '/wscreen');
                },
                minWidth: 150.0,
                height: 42.0,
                child: const Text(
                  'Tutor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
