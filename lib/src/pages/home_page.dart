import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/share_prefs/user_preferences.dart';
import 'package:userpreferencesapp/src/widgets/sidemenu_widget.dart';


class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new UserPreferences();

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
            Text('Gender: ${prefs.gender}'),
            Divider(),
            Text('User name: '),
            Divider()
          ],
        ),
      ),
    );
  }
}