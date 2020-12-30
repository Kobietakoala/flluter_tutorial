import 'package:brew_crew/models/my_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugar;
  int _currentStrenght;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return StreamBuilder<MyUserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        if(snapshot.hasData){
          MyUserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Update your brew settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentSugar ?? userData.sugars,
                  items: sugars.map((sugar){
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentSugar = val),
                ),
                SizedBox(height: 20.0),
                Slider(
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (val) => setState(() => _currentStrenght = val.round()),
                  value: (_currentStrenght ?? userData.strength).toDouble(),
                  activeColor: Colors.brown[_currentStrenght ?? userData.strength],
                  inactiveColor: Colors.brown[_currentStrenght ?? userData.strength],
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                      dynamic response = await DatabaseService(uid: user.uid).updateUserData(
                          _currentSugar ?? userData.sugars,
                          _currentName ?? userData.name,
                          _currentStrenght ?? userData.strength
                      );
                      Navigator.pop(context);
                    }else{

                    }

                  },
                )
              ],
            ),
          );

        }else{
          return Loading();
        }
      }
    );
  }
}
