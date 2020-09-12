import 'package:flutter/material.dart';
class BottomModalWidget extends StatefulWidget {
  final double lat, lan;
  BottomModalWidget(this.lat,this.lan);
  @override
  _BottomModalWidgetState createState() => _BottomModalWidgetState();
}

class _BottomModalWidgetState extends State<BottomModalWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController position;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Details"),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                  hintText: "Enter Your Name"
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: position=TextEditingController(text: "Latitude = "+widget.lat.toString()+" Longitude = "+widget.lan.toString()),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                // border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                  hintText: "Enter Your Name"
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              onPressed: (){
                print("Name = "+name.text);
                print(position.text);
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
