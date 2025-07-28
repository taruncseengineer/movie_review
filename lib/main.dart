import 'package:Movierecommandation/bottemnavigation.dart';
import 'package:Movierecommandation/ui/Signup.dart';
import 'package:Movierecommandation/ui/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Movie Recommandation",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.blueGrey),
    home: 
