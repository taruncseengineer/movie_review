import 'dart:convert';

import 'package:Movierecommandation/ui/discription.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List trendingData;
  Future trendingmovie() async {
    String url =
        "https://api.themoviedb.org/3/trending/all/week?api_key=61e47ed21ff52f097a7024e461b438e2";
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        setState(() {
          trendingData = jsondata['results'];
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    trendingmovie().then((value) => print(value.toString())).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    trendingmovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: firstcolor,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingData == null ? 0 : trendingData.length,
            itemBuilder: (context, index) {
              var data = trendingData[index];
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
                            date:
                                "${data['release_date'] == null ? data['first_air_date'] : data['release_date']}",
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
