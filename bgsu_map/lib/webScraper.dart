import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

Future<List<String>> extractData() async {
  //form connection to webpage
  final response =
      await http.Client().get(Uri.parse('https://events.bgsu.edu/'));

  if (response.statusCode == 200) {
    //if connection is formed
    //get html; document from page
    var document = parser.parse(response.body);

    var events = document
        .getElementsByClassName('content-wrapper')[0]
        .children[2]
        .children[1]
        .children[0]
        .children[0]
        .children;

    try {} catch (e) {
      return ['', '', 'ERROR!'];
    }
  } else {
    return ['', '', 'ERROR: ${response.statusCode}.'];
  }
  return [];
}
