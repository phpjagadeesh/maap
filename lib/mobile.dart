import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Mobile extends StatelessWidget {
   String name;
   Mobile(this.name);
  _submitMobile() {
    print(this.name);
    new SendSms();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mobile Verification Page"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new TextField(),
            new RaisedButton(onPressed: () {_submitMobile();},
            color: Colors.red,
            child:new Text('Please enter your Mobile number'),
            ),
          ],
        ),

      ),
    );
  }
}


//Send SMS
class SendSms extends StatefulWidget {
  @override
  _SendSmsState createState() => new _SendSmsState();
}

class _SendSmsState extends State<SendSms> {
  static const platform = const MethodChannel('sendSms');

  Future<Null> sendSms()async {
    print("SendSMS");
    try {
      final String result = await platform.invokeMethod('send',<String,dynamic>{"phone":"+919633195222","msg":"Hello! I'm sent programatically."});
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        alignment: Alignment.center,
        child: new FlatButton(onPressed: () => sendSms(), child: const Text("Send SMS")),
      ),
    );
  }
}