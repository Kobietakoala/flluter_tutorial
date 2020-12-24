import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: KoalaCard(),
  ));
}

class KoalaCard extends StatefulWidget {
  @override
  _KoalaCardState createState() => _KoalaCardState();
}

class _KoalaCardState extends State<KoalaCard> {
  double power = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Koala Card"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            double val = power / 10;
            power += ((power + 1) - val).toInt();
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Center(
                 child: CircleAvatar(
                     backgroundImage: AssetImage('assets/koala.jpg'),
                     radius: 45.0
                 )),
             Divider(
               height: 86.0,
               color: Colors.grey
             ),
             Text(
               "NAME",
               style: TextStyle(
                   color: Colors.white70,
                   letterSpacing: 2.0,
               )
             ),
             SizedBox(height: 10.0),
             Text(
                 "Koala the programmer",
                 style: TextStyle(
                   color: Colors.blueGrey[600],
                   letterSpacing: 2.0,
                   fontSize: 24.0,
                   fontWeight: FontWeight.bold
                 )
             ),
             Divider(
                 height: 86.0,
                 color: Colors.grey
             ),
             Text(
                 "POWER",
                 style: TextStyle(
                     color: Colors.white70,
                     letterSpacing: 2.0,
                 )
             ),

             SizedBox(height: 10.0),
             Text(
                 '$power',
                 style: TextStyle(
                     color: Colors.blueGrey[600],
                     letterSpacing: 2.0,
                     fontSize: 24.0,
                     fontWeight: FontWeight.bold
                 )
             ),

           ],


        ),
      ),
    );
  }
}



