import 'package:flutter/material.dart';
import 'package:photo_gallery/network/ApiClient.dart';

class SearchDetails extends StatefulWidget {
  final String searchText;
  SearchDetails(this.searchText);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SearchDetails> {

  @override
  Widget build(BuildContext context) {
    print(widget.searchText);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
      ),
      body: FutureBuilder(
          future: getPics(widget.searchText),
          builder: (context, snapshot) {
            final Map data = snapshot.data;
            print(snapshot);
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                "Some error occurred",
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: (data["hits"] as List).length,
                  itemBuilder: (context, index) {
                    return Container(
                        constraints: BoxConstraints.tightFor(width: 0.0, height: 200.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                          title: Image.network(
                            data['hits'][index]['largeImageURL'],
                            fit: BoxFit.fitWidth,
                          ),
                        ));
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
