//https://api.themoviedb.org/4/list/1?page=1&api_key=61e47ed21ff52f097a7024e461b438e2

//ta te hi en
import 'package:Movierecommandation/ui/discription.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopMovies extends StatefulWidget {
  @override
  _TopMoviesState createState() => _TopMoviesState();
}

class _TopMoviesState extends State<TopMovies> {
  List topmovie;
  Future topmovies() async {
    String url =
        'https://api.themoviedb.org/4/list/1?page=1&api_key=61e47ed21ff52f097a7024e461b438e2';
    try {
      final response = await http.get(url);
      var jsondata = json.decode(response.body);
      setState(() {
        topmovie = jsondata['results'];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    topmovies().then((value) => print(value.toString())).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: firstcolor,
        height: size.height,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topmovie == null ? 0 : topmovie.length,
            itemBuilder: (context, index) {
              var data = topmovie[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new Discription(
                            image: "https://image.tmdb.org/t/p/w500" +
                                "${data['poster_path']}",
                            title:
                                "${data['name'] == null ? data['title'] : data['name']}",
                            type: data['media_type'],
                            language: data['original_language'],
                            overview: data['overview'],
                            date: data['release_date'],
                            vote: data['vote_average'].toString(),
                            average: data['vote_average'],
                          )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5, color: textcolor),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500" +
                                  "${data['poster_path']}"))),
                ),
              );
            }),
      ),
    );
  }
}
