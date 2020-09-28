import 'package:flutter/material.dart';
import 'package:userpreferencesapp/src/widgets/sidemenu_widget.dart';


class SettingsPage extends StatelessWidget {

  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      drawer: SideMenuWidget(),
      body: Center(child: Text('Settings page')),
    );
  }
}