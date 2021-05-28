import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  Map results = {};
  List data = [];
  @override
  Widget build(BuildContext context) {

    results = ModalRoute.of(context).settings.arguments;
    data = (results['result']);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(5,10,5,5),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){
            return Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, '/detailview', arguments: {
                      'item' : data[index]['recipe'],
                    });
                  },
                  title: Text(data[index]['recipe']['label']),
                  subtitle: Text(data[index]['recipe']['dietLabels'].isEmpty ?  "--" : data[index]['recipe']['dietLabels'][0]  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index]['recipe']['image']),
                    radius: 25.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
