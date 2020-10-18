import 'package:Movierecommandation/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('userdata');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: firstcolor,
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0.3,
          backgroundColor: textcolor,
          centerTitle: true,
          title: Text(
            "Movie hub",
            style: TextStyle(
                color: firstcolor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        body: Center(
          child: Text(''),
          //Text(widget.user.displayName.toString()),
        )
        //  StreamBuilder<QuerySnapshot>(
        //     stream: reference.snapshots(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Text("Somethings went wrong");
        //       }
        //       return ListView(
        //         children: snapshot.data.docs.map((DocumentSnapshot document) {
        //           return Center(
        //             child: Container(
        //               child: Column(
        //                 children: [
        //                   Text(document.data()['name']),
        //                 ],
        //               ),
        //             ),
        //           );
        //         }).toList(),
        //       );
        //     })
        );
  }
}
