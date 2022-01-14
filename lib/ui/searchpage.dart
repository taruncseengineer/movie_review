// import 'package:Movierecommandation/model/trending.dart';
import 'package:Movierecommandation/ui/discription.dart';
import 'package:Movierecommandation/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List querydata;
  Future querymovie(String input) async {
    final String url =
        'https://api.themoviedb.org/3/search/movie?api_key=value&language=en-US&page=1&include_adult=false&query=' +
            input;
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        setState(() {
          querydata = jsondata['results'];
        });
      }
    } catch (e) {
      return CircularProgressIndicator();
    }
  }

  void inputdata(String input) {
    querymovie(input);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: firstcolor,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 10, top: 5),
                  width: size.width * 0.80,
                  decoration: BoxDecoration(
                      color: textcolor,
                      borderRadius: BorderRadius.circular(24)),
                  child: TextField(
                    onSubmitted: (String input) {
                      inputdata(input);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: "Search"),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: querydata == null ? 0 : querydata.length,
                  itemBuilder: (context, index) {
                    var data = querydata[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(width: 2, color: textcolor),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => new Discription(
                                      title: data['original_title'],
                                      image: "https://image.tmdb.org/t/p/w500" +
                                          "${data['poster_path']}",
                                      language: data['original_language'],
                                      overview: data['overview'],
                                      type: "Movie",
                                      vote: data['vote_average'].toString(),
                                      date: data['release_date'],
                                    )));
                          },
                          child: ListTile(
                            title: Text(
                              data['original_title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: textcolor,
                                  //color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: firstcolor,
                              backgroundImage: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500" +
                                      "${data['poster_path']}"),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
// https://api.themoviedb.org/3/search/movie?api_key=61e47ed21ff52f097a7024e461b438e2&language=en-US&page=1&include_adult=false&query=spiderman
