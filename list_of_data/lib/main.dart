import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

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

  List<Quote> quotes = [
    Quote(text: "tekst1", author: "Super Koala"),
    Quote(text: "tekst2", author: "Super Koala"),
    Quote(text: "tekst2", author: "Super Koala"),
    Quote(text: "tekst2", author: "Super Koala"),
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
        children: quotes.map((qute) => QuoteCard(quote: qute,)).toList(),
      ),
      );
  }
}




