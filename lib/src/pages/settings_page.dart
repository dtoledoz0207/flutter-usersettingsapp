import 'package:flutter/material.dart';
import 'package:userpreferencesapp/src/share_prefs/user_preferences.dart';
import 'package:userpreferencesapp/src/widgets/sidemenu_widget.dart';


class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor;
  int _gender;
  String _name;

  TextEditingController _textController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    prefs.lastPage = SettingsPage.routeName;

    _secondaryColor = prefs.secondaryColor;
    _gender = prefs.gender;
    _name = prefs.username;
    _textController = new TextEditingController(text: _name);
  }

  _setSelectedRadio(int value) {
    prefs.gender = value;

    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: SideMenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),

          Divider(),

          SwitchListTile(
            value: _secondaryColor,
            title: Text('Secondary color'),
            onChanged: (bool value) {
              setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              });
            }
          ),

          RadioListTile(
            value: 1,
            groupValue: _gender,
            title: Text('Male'),
            onChanged: _setSelectedRadio
          ),

          RadioListTile(
            value: 2,
            groupValue: _gender,
            title: Text('Famale'),
            onChanged: _setSelectedRadio
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Name:',
                helperText: 'Type your name'
              ),
              onChanged: (String value) {
                prefs.username = value;
              },
            ),
          )

        ],
      ),
    );
  }
}