import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {

  Map data ={};
  Map item = {};
  String bullet = "\u2022 ";

  
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    item = data['item'];

    List ingredientList = item['ingredientLines'];
    List healthLabels = item['healthLabels'];

    Widget displayLabel(value){
      return Padding(
        padding: EdgeInsets.all(5),
        child: Badge(
            toAnimate: false,
            shape: BadgeShape.square,
            badgeColor: Colors.teal[300],
            borderRadius: BorderRadius.circular(8),
            badgeContent: Text(value, style: TextStyle(color: Colors.white, fontSize: 15)),

        ),
      );
    }

    _launchURL(address) async {
      String url = address;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Details'
        ),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(item['image']),
                  radius: 90,
                ),
              ),
              Divider(height: 50, color: Colors.teal[300],),
              Text(
                item['label'],
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.teal[300],
                ),
              ),
              SizedBox(height: 50,),


              Text(
                'Ingredients List',
                style: TextStyle(
                  fontSize: 25,

                  color: Colors.black
                ),
              ),
              SizedBox(height: 20,),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: ingredientList.length,
                  itemBuilder: (context,index){
                    return Row(
                      children: [
                        Text(
                          bullet,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ingredientList[index],
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey[700]
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  ),
              SizedBox(height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Labels',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 20,),
                  Wrap(
                    children: healthLabels.map((e) => displayLabel(e)).toList(),
                  )
                ],
              ),
              SizedBox(height: 50,)

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        onPressed: () {
          _launchURL(item['url']);
        },
        child: Icon(Icons.arrow_forward_ios_sharp,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
