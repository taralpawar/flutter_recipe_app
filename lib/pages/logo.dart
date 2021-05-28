import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {

  void getDelay(){
    Future.delayed(const Duration(microseconds: 3000), (){
      Navigator.pushReplacementNamed(context, '/');
    });
  }
  @override
  void initState() {
    super.initState();
    getDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          alignment: Alignment.center,
          decoration:  BoxDecoration(

            image: DecorationImage(
                image: AssetImage('assets/recipe.png'),
                fit: BoxFit.fill,
            ),
          ),
        ),
      )
    );
  }
}
