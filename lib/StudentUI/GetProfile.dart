import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetProfile extends StatefulWidget {
  GetProfile(BuildContext context);

  @override
  State<GetProfile> createState() => _GetProfileState();
}

class _GetProfileState extends State<GetProfile> {

  //FirebaseFirestore firestore = FirebaseFirestore.instance;
 late String subject;
late String contact_info;
late String appointment;
late String description;
  @override
  Widget build(BuildContext context) {
    CollectionReference TutorUser =
        FirebaseFirestore.instance.collection('TutorUser');
    return StreamBuilder<QuerySnapshot>(
        stream: TutorUser.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text("There are no users");
          return ListView(children: getExpenseItems(snapshot));
        });
  }

  CollectionReference bookings = FirebaseFirestore.instance.collection('Bookings');

  Future<void> addBooking() {
    return bookings.doc().set({
      'subject': subject,
      'contact_info' : contact_info,
      'appointment': appointment,
      'description': description,
    })
        .then((value) => print('Booking made')).catchError((error) => print('Failed to add user: $error'));
  }
  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map(
          (doc) => Padding(
              padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 600,
                  child: Column(
                    children: [
                        Card(
                          margin: const EdgeInsets.all(10.0),
                          color: Colors.tealAccent[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.account_circle_sharp, size: 105),
                              title: Text(
                                doc["name"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              minVerticalPadding: 30,
                              subtitle: Text(doc["description"],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15)),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {subject = value;},
                        decoration: const InputDecoration(
                          hintText: 'Enter the subject',
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {contact_info = value;},
                        decoration: const InputDecoration(
                          hintText: 'Enter contact details',
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {appointment=value;},
                        decoration: const InputDecoration(
                          hintText: 'Enter booking time & date',
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {description=value;},
                        decoration: const InputDecoration(
                          hintText: 'Describe your approximate level of understanding',
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color: Colors.teal,
                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () async {addBooking();
                              Navigator.pop(context);},
                            minWidth: 250.0,
                            height: 42.0,
                            child: const Text(
                              'Send request',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),

          )
        .toList();
  }
}
