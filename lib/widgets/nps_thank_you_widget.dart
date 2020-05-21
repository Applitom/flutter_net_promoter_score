import 'package:flutter/material.dart';

class NpsThankYouWidget extends StatefulWidget {
  @override
  NpsThankYouWidgetState createState() => new NpsThankYouWidgetState();
}

class NpsThankYouWidgetState extends State<NpsThankYouWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 5,),
          Icon(Icons.done,size: 80,),
          SizedBox(height: 5,),
          Text("Thanks for your feedback"),
          SizedBox(height: 10,),
        ],
    );
  }
}
