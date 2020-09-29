import 'package:flutter/material.dart';
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

    _textController = new TextEditingController(text: _name);
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
            onChanged: (value) {
              setState(() {
                 _gender = value;
              });
            }
          ),

          RadioListTile(
            value: 2,
            groupValue: _gender,
            title: Text('Famale'),
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            }
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