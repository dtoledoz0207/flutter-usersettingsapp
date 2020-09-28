import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/widgets/sidemenu_widget.dart';


class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User preferences')),
      drawer: SideMenuWidget(),
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