import 'package:Movierecommandation/model/favorite.dart';
import 'package:Movierecommandation/model/topmovie.dart';
import 'package:Movierecommandation/model/trending.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0.3,
          backgroundColor: textcolor,
          centerTitle: true,
          title: Text(
            "Movie Review",
            style: TextStyle(
                color: firstcolor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        backgroundColor: firstcolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Movies",
                    style: TextStyle(
                        fontSize: 20,
                        color: textcolor,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: size.height * 0.30,
                    child: new TopMovies(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Trending Movies",
                    style: TextStyle(
                        fontSize: 20,
                        color: textcolor,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: firstcolor,
                    height: size.height * 0.30,
                    child: new Trending(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Favorite Movies",
                    style: TextStyle(
                        fontSize: 20,
                        color: textcolor,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: size.height * 0.30,
                    child: new FavoriteMovie(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
