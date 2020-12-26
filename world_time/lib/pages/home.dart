import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
       body: SafeArea(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
               child: FlatButton.icon(
                   onPressed: () {
                     Navigator.pushNamed(context, '/location');
                   },
                   icon: Icon(Icons.edit_location),
                   label: Text('Edit location')),
             ),
             SizedBox(height: 20.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   data['location'],
                   style: TextStyle(
                     fontSize: 20.0,
                     letterSpacing: 2.0
                   )
                 )
               ],
             ),
             SizedBox(height: 20.0,),
             Text(
               data['time'],
               style: TextStyle(
                 fontSize: 66.0
               ),
             )
           ]
         ),

       ),
    );
  }
}
