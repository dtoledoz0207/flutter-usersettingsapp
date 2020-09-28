import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User preferences')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Secondary color: '),
            Divider(),
            Text('Gender: '),
            Divider(),
            Text('User name: '),
            Divider()
          ],
        ),
      ),
    );
  }
}