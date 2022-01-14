import 'package:Movierecommandation/ui/discription.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoriteMovie extends StatefulWidget {
  @override
  _FavoriteMovieState createState() => _FavoriteMovieState();
}

class _FavoriteMovieState extends State<FavoriteMovie> {
  List favoritedata;
  Future favoritemovie() async {
    try {
      String url =
          "https://api.themoviedb.org/3/trending/movie/day?api_key=value";
      final response = await http.get(url);
      var jsondata = json.decode(response.body);
      setState(() {
        favoritedata = jsondata['results'];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    favoritemovie().then((value) => print(value.toString())).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void dispose() {
    favoritemovie();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: firstcolor,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favoritedata == null ? 0 : favoritedata.length,
            itemBuilder: (context, index) {
              var data = favoritedata[index];
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
