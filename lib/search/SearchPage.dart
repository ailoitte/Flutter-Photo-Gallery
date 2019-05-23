import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/search_details/SearchDetails.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Bay"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
              constraints: BoxConstraints.tightFor(width: 200.0, height: 200.0),
              child: Image.asset(
                "assets/images/photobay.png",
                fit: BoxFit.scaleDown,
              )),
          ListTile(
            title: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Eg Dogs, Cats & Bananas",
                labelText: "Enter a category",
                contentPadding:
                    const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 25.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          ListTile(
            title: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SearchDetails(searchController.text.trim().replaceAll(" ", "+"))));
                },
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
                height: 40.0,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          )
        ],
      ),
    );
  }
}
