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
  final RideHistoryController _controller = RideHistoryController();
  Stream<QuerySnapshot> _streamRides =
      FirebaseFirestore.instance.collection('rides').snapshots();
  void initState() {
    super.initState();
    _streamRides = FirebaseFirestore.instance.collection('rides').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamRides,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> listQDS = querySnapshot.docs;
            return ListView.builder(
              itemCount: listQDS.length,
              itemBuilder: (context, idx) {
                QueryDocumentSnapshot doc = listQDS[idx];
                String toRet = doc['fare'] + '         ' + doc['rating'];
                Container(
                  color: Colors.white, //make the table
                );
                return Text(toRet, style: TextStyle(fontSize: 16));
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
