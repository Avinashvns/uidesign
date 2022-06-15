

import 'package:flutter/material.dart';
import 'package:uidesign/screens/apicaller.dart';
import 'package:uidesign/screens/registerprofileclass.dart';


class RegisterShowing extends StatefulWidget {

  @override
  _RegisterShowingState createState() => _RegisterShowingState();
}

class _RegisterShowingState extends State<RegisterShowing> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Showing"),
        //titleSpacing: 4,
        backgroundColor: Colors.orange.shade300,
        automaticallyImplyLeading: false,
        elevation: 20,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              //width: 350,
              //height: 80,
              //color: Colors.teal[50],
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Details: ",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 3,
                    indent: 5,
                    endIndent: 10,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Name :- "+Utilities.ownerProfile.name),

                  SizedBox(
                    height: 15,
                  ),
                  Text("Email :- "+Utilities.ownerProfile.name),

                  SizedBox(
                    height: 15,
                  ),
                  Text("Gender :- "+Utilities.ownerProfile.name),

                  SizedBox(
                    height: 15,
                  ),
                  Text("status :- "+Utilities.ownerProfile.name),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
