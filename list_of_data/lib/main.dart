import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<String> quotes = [
    'Apple', 'Banana', 'Onion'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Great Quote List"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        ),
      body: Column(
        children: quotes.map((qute) => Text(qute)).toList(),
      ),
      );
  }
}



