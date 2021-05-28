
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};
  String APPID = '7085fe2a';
  String APIKEY = '28020320151bc9e2165a84014b9ced76';
  String query = '';
  void getResult() async {

          Response response = await get(Uri.parse('https://api.edamam.com/search?q=$query&app_id=$APPID&app_key=$APIKEY'));
          Map result = json.decode(response.body);
          Navigator.pushReplacementNamed(context, '/searchresult' , arguments: {
            'result' : result['hits'],
          });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    query = (data['querry']);
    getResult();

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.teal,
          size: 70.0,
        ),
      ),
    );
  }
}
