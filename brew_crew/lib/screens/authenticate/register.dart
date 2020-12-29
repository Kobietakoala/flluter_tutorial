import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sing Up'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        centerTitle: true,
        actions: [
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign in')
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                TextFormField(
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
