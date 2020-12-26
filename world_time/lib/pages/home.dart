import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    print(data);

    // set background
    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.lightBlue[200] : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
       body: SafeArea(
         child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('asstes/$bgImg'),
               fit: BoxFit.cover
             )
           ),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                 child: FlatButton.icon(
                     onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'time': result['time'],
                           'location': result['location'],
                           'isDayTime': result['isDayTime'],
                           'flag': result['flag'],
                         };
                       });
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

       ),
    );
  }
}
