import 'package:Movierecommandation/bottemnavigation.dart';
import 'package:Movierecommandation/ui/Signup.dart';
import 'package:Movierecommandation/ui/profile.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future loginuser() async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email.trim(), password: password))
          .user;
      //await user.updateProfile(displayName: );
      // var data=user.updateProfile(displayName: )
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BotomNBar()));
      }
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
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Welcome!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: textcolor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Movie Review",
                style: TextStyle(
                    fontSize: 20,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: textcolor),
              ),
            ),
            SizedBox(
              height: 20,
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
                          height: 30,
                        ),
                        InkWell(
                          onTap: () => loginuser(),
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: firstcolor),
                            child: Center(
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: textcolor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Container(
                            height: 50,
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: firstcolor),
                            child: Center(
                              child: Text(
                                "Create an account!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: textcolor),
                              ),
                            ),
                          ),
                        ),
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
