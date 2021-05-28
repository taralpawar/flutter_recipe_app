

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String querry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.0,),


                  Center(
                    child: Text(
                      "What would you like to cook today?",
                      style: TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    ),
                  ),
              SizedBox(height: 50.0,),
              TextField(
                onChanged: (text){
                  querry = text;
                },

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,

                ),
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter your keyword',
                    hintStyle: TextStyle(
                      color: Colors.white,
                          fontSize: 20.0,
                      letterSpacing: 2.0
                    ),

                ),


              ),
                SizedBox(height: 50.0,),
                FlatButton.icon(
                  onPressed: (){
                    print(querry);
                    Navigator.pushNamed(context, '/loading', arguments: {
                      'querry' : querry,
                    });
                  },
                  icon: Icon(
                  Icons.search,
                    color: Colors.white,
                ),
                  label: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      ),
                  ),

                )

              ],
            ),
        ),
      ),


      );



  }
}
