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
      resizeToAvoidBottomInset: true,
      body: StreamBuilder<QuerySnapshot>(
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
            List<QueryDocumentSnapshot> listQDS =
                querySnapshot.docs; //Extract docs from query and store in list
            return ListView.builder(
              itemCount: listQDS.length,
              itemBuilder: (context, idx) {
                QueryDocumentSnapshot doc = listQDS[idx];
                String toRet = doc['fare'] +
                    '         ' +
                    doc['rating']; //Extract fare and rating
                Container(
                  color: Colors.white, //make the table
                );
                return SizedBox(
                    height: 50,
                    width: 150,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Fare    Rating',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(toRet, style: TextStyle(fontSize: 16)),
                      )
                    ]));
              },
            );
          }

          return Center(
              child:
                  CircularProgressIndicator()); //Render moving circle for loading if data fetch takes time
        },
      ),
    );
  }
}
