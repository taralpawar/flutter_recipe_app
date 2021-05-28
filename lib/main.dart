
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home.dart';
import 'package:recipe_app/pages/loading.dart';
import 'package:recipe_app/pages/searchresults.dart';
import 'package:recipe_app/pages/detailview.dart';
import 'package:recipe_app/pages/logo.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/logo',
    routes: {
      '/logo' : (context) => Logo(),
      '/' : (context) => Home(),
      '/loading' : (context) => Loading(),
      '/searchresult' : (context) => SearchResults(),
      '/detailview' : (context) => DetailView(),
    },
  ));
}

