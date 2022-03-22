
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetBookings extends StatelessWidget {
  var context;

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('Bookings');

  GetBookings(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: bookings.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text("There are no users");
          return ListView(children: getUsers(snapshot));
        });
  }

  getUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map(
          (doc) => Scrollbar(
            child: SizedBox(
              height: 300,
              child: Card(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.tealAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(children: [
                    const Icon(
                      Icons.account_circle_sharp,
                      size: 90,
                      color: Colors.black38,
                    ),
                    Text(doc["subject"],
                      style: const TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(doc["contact_info"],
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15)),
                    Text(
                      doc['appointment'],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),

                    ),
                    Text(
                      doc['description'],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                  ])),
            ),
          ),
        )
        .toList();
  }
}
