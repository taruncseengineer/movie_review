import 'package:Movierecommandation/cloud.dart';
import 'package:Movierecommandation/ui/login.dart';
import 'package:Movierecommandation/ui/profile.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username;
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future signupuser() async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password))
          .user;
      await DatabaseService(uid: user.uid).updateUserData(username, email);
      await user.updateProfile(
        displayName: username,
      );
      if (user != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LogIn()));
      }
      return ProfilePage(
        user: user,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Text(
            //     "Movie Review",
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.w700,
            //         color: textcolor),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Create An Account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: textcolor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(width: 2, color: firstcolor)),
                          child: TextField(
                            onChanged: (val) {
                              username = val;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Username",
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(width: 2, color: firstcolor)),
                          child: TextField(
                            onChanged: (val) {
                              email = val;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email",
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, top: 0),
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(width: 2, color: firstcolor)),
                          child: TextField(
                            onChanged: (val) {
                              password = val;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                hintText: "Password",
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => signupuser(),
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: firstcolor),
                            child: Center(
                              child: Text(
                                "SignUp!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: textcolor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
