// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

// This app is a stateful, it tracks the user's current choice.
class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Basic AppBar'),
          actions: <Widget>[
            new IconButton(
              // action button
              icon: new Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            new IconButton(
              // action button
              icon: new Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(3.0),
          child: new ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  _onSendAppolagy() async {
    String deviceName;
    String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    var build = await deviceInfoPlugin.androidInfo;
    deviceName = build.model;
    deviceVersion = build.version.toString();
    print('${deviceName}');
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.network(
              'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 1.0, bottom: 60.0, top: 20.0),
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Enter phone number here'),
                        ),
                      ),
                    ],
                  ),
                  new RaisedButton(
                    onPressed: () {
                      _onSendAppolagy();
                    },
                    color: Colors.red,
                    child: new Text(
                      "Please Give To Me Apology",
                      style: new TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(new BasicAppBarSample());
}
