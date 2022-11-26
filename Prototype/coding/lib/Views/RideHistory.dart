import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coding/Controllers/RideHistoryController.dart';

class RideHistory extends StatefulWidget {
  const RideHistory({Key? key}) : super(key: key);

  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  final RideHistoryController _controller =
      RideHistoryController(); //Initialise ride history controller
  Stream<QuerySnapshot> _streamRides = FirebaseFirestore.instance
      .collection('rides')
      .snapshots(); //Fetch snapshots from rides collection in firestore
  void initState() {
    super.initState();
    //if (FirebaseAuth.instance.currentUser != null) {
    _streamRides = FirebaseFirestore.instance.collection('rides').snapshots();
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride History'),
        backgroundColor: Color(0xff4a44bf),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromRGBO(118, 146, 255, 1)),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'RECENT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ), // Title for the list view in this case RECENT
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  _streamRides, //Adding snapshots in stream so that new data is rendered in real time
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text(snapshot.error
                          .toString())); //Render error if snapshots cannot be fetched
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  //Snapshots updating in real time
                  QuerySnapshot querySnapshot =
                      snapshot.data; //Extract data from snapshot
                  List<QueryDocumentSnapshot> listQDS = querySnapshot
                      .docs; //Extract docs from query and store in list
                  return ListView.builder(
                    itemCount: listQDS.length,
                    itemBuilder: (context, idx) {
                      QueryDocumentSnapshot doc = listQDS[idx];
                      String fare = doc['fare'];
                      String rating = doc['rating']; //Extract fare and rating
                      return Column(children: <Widget>[
                        // Each ride will be a row
                        Container(
                          padding: EdgeInsets.only(top: 12),
                          height: 50,
                          decoration: BoxDecoration(
                            // border and background styling
                            color: Color.fromRGBO(50, 58, 80, 1),
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Color.fromRGBO(118, 146, 255, 1)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly, // spacing of Fare and Rating
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // center the items within the row
                            children: [
                              SizedBox(
                                child: Text(
                                  'Fare:',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    'PKR ' + fare,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Rating: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width:
                                    60, // max size of 5 stars will be 5*12=60
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: int.parse(rating),
                                  itemBuilder: (context, index) {
                                    return Icon(Icons.star,
                                        size:
                                            12); // star icons as per the rating data
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]);
                    },
                  );
                }

                return Center(
                    child:
                        CircularProgressIndicator()); //Render moving circle for loading if data fetch takes time
              },
            ),
          ),
        ],
      ),
    );
  }
}
