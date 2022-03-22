import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/StudentUI/card_expanded.dart';
class GetUsers extends StatelessWidget {
  var context;

  CollectionReference TutorUser =
  FirebaseFirestore.instance.collection('TutorUser');
  GetUsers(this.context);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: TutorUser.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text("There are no users");
          return ListView(children: getUsers(snapshot));
        });
  }

  getUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map(
          (doc) =>
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, '/profile');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(doc)));
            },
            child: Card(
              margin: const EdgeInsets.all(10.0),
              color: Colors.tealAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(children: [
                ListTile(
                    leading: const Icon(
                      Icons.account_circle_sharp,
                      size: 90,
                      color: Colors.black38,
                    ),
                    title: Text(
                      doc["name"],
                      style: const TextStyle(
                        height: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    subtitle: Text(doc["description"],
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15)),
                ),
                const Padding(
                  padding: EdgeInsets.all(22.0),
                ),

                ])
              ),
            ),

    )
        .toList();
  }


}
