import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uidesign/screens/apicaller.dart';
import 'package:uidesign/screens/registerprofileclass.dart';
import 'package:uidesign/screens/showingdata.dart';

enum SingingCharacter { male, female, other }

class RegisterOwner extends StatefulWidget {
  final TextEditingController name_controller1 =
      TextEditingController(text: "");
  final TextEditingController email_controller2 =
      TextEditingController(text: "");
  final TextEditingController gender_controller3 =
      TextEditingController(text: "");
  final TextEditingController status_controller4 =
      TextEditingController(text: "");

  void controlling() {
    String name = name_controller1.text;
    String email = email_controller2.text;
    String gender = "hi";
    String status = status_controller4.text;
  }

  static List<String> genders = ['Male', 'Female', 'Others'];

  String flexs = "";
  String dob = "";

  @override
  _RegisterOwnerState createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {
  SingingCharacter? _character = SingingCharacter.male;
  int? _result =0;
      //Utilities.ownerProfile.getGenderNo(Utilities.ownerProfile.gender);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                  Text("First Name"),
                  TextField(
                    controller: widget.name_controller1,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your first name',
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    onChanged: (text) {
                      widget.flexs = text;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Email"),
                  TextField(
                    controller: widget.email_controller2,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your last name',
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    onChanged: (text) {
                      widget.flexs = text;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Gender",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Container(
                    child: Column(
                      children: [
                        RadioListTile<int?>(
                          title: Text(RegisterOwner.genders[0]),
                          value: 0,
                          //selected: false,
                          groupValue: _result,
                          onChanged: (int? value) {
                            setState(() {
                              _result = value;
                            });
                          },
                        ),
                        RadioListTile<int?>(
                          title: Text(RegisterOwner.genders[1]),
                          value: 1,
                          //selected: true,
                          groupValue: _result,
                          onChanged: (int? value) {
                            setState(() {
                              _result = value;
                            });
                          },
                        ),
                        RadioListTile<int?>(
                          title: Text(RegisterOwner.genders[2]),
                          value: 2,
                          //selected: false,
                          groupValue: _result,
                          onChanged: (int? value) {
                            setState(() {
                              _result = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Status"),
                  TextField(
                    controller: widget.status_controller4,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your mobile no',
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    onChanged: (text) {
                      widget.flexs = text;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            // Button Submitted
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                //width: 50,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: const Size.fromHeight(5),
                  ),
                  child: const Text("Submit"),
                  onPressed: () async {
                    //String _gender=(_result==0)?"male":(_result==1)?"female":"other";

                    String name = widget.name_controller1.text;
                    String email = widget.email_controller2.text;
                    String gender = (_result == 0)
                        ? "male"
                        : (_result == 1)
                            ? "female"
                            : "other";
                    ;

                    String status = widget.status_controller4.text;

                    print(name);

                    print(email);
                    print(gender);
                    print(status);

                    String sitename = "gorest.co.in";
                    String path = "/public/v2/users";

                    //maps
                    Map<String, String> map = Map();
                    map.putIfAbsent("name", () => name);
                    map.putIfAbsent("email", () => email);
                    map.putIfAbsent("gender", () => gender);
                    map.putIfAbsent("status", () => status);

                    var data =
                        await ApiCaller.callTheGetApi(sitename, path, map);
                    print("hi");
                    print(data);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Submit Successfully")),
                    );

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterShowing()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
