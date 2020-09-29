import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userpreferencesapp/src/widgets/sidemenu_widget.dart';


class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'David';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _loadPrefs();
    _textController = new TextEditingController(text: _name);
  }

  _loadPrefs() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     _gender = prefs.getInt('gender');
     setState(() {});
  }

  _setSelectedRadio(int value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('gender', value);

    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
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
              onChanged: (String value) {},
            ),
          )

        ],
      ),
    );
  }
}