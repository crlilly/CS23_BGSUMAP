import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html/dom.dart';

Future extractData() async {
  //form connection to webpage
  final response =
      await http.Client().get(Uri.parse('https://events.bgsu.edu/'));

  if (response.statusCode == 200) {
    //if connection is formed
    //get html; document from page
    var document = parser.parse(response.body);
    List<Map<String, dynamic>> linkMap = [];

    var events = document
        .getElementsByClassName('content-wrapper')[0]
        .children[2]
        .children[1]
        .children[0]
        .children[0]
        .children;

    var eventTitle;
    var eventLoc;
    var eventDateTime;

    for (var event in events) {
      eventTitle = event.children[1]
          .getElementsByClassName('em-card_title')[0]
          .getElementsByTagName('a')[0]
          .innerHtml;

      eventDateTime = event.children[1]
          .getElementsByClassName('em-card_event-text')[0]
          .children[0]
          .innerHtml;

      eventLoc = event.children[1]
          .getElementsByClassName('em-card_event-text')[0]
          .children[1]
          .innerHtml;

      linkMap.add({
        'title': eventTitle,
        'date': eventDateTime,
        'location': eventLoc,
      });
    }

    return json.encode(linkMap);

    try {} catch (e) {
      return ['', '', 'ERROR!'];
    }
  } else {
    return ['', '', 'ERROR: ${response.statusCode}.'];
  }
  return [];
}
