import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Confirm_Donation(),
    debugShowCheckedModeBanner: false,
  ));
}

class Confirm_Donation extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Confirm_Donation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pickupdateController = TextEditingController();
  late Map data;
  late String name, contact, address, pickupdate;

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert!'),
            content: Text('Kindly provide all the details'),
            actions: <Widget>[
              new ElevatedButton(
                child: new Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
            elevation: 24.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          );
        });
  }

  _displayDialogsuccess(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmed Donation'),
            content: Text('Donation Successful!'),
            actions: <Widget>[
              new ElevatedButton(
                child: new Text('Close'),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Categories()));
                },
              )
            ],
            elevation: 24.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Confirm Donation',
              style: TextStyle(color: Color(0xffffffff)),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF0A5699)),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Please enter your personal details and choose a pickup date.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[
                    // FilteringTextInputFormatter.digitsOnly
                    // ],
                    controller: contactController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact no.',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: pickupdateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pickup date (dd/mm/yyyy)',
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\nPickup timings are from 9:00 am to 8:30 pm.\n',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0A5699), // Background color
                          onPrimary: Color(
                              0xFF0A5699)), // Text Color (Foreground color)

                      child: Text(
                        'Confirm Donation',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        name = nameController.text;
                        pickupdate = pickupdateController.text;
                        address = addressController.text;
                        contact = contactController.text;
                        if (name != '' ||
                            pickupdate != '' ||
                            address != '' ||
                            contact != "") {
                          // addData();
                          _displayDialogsuccess(context);
                        } else {
                          _displayDialog(context);
                        }
                      },
                    )),
              ],
            )));
  }
}
