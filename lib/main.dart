import 'package:contacts/pages/page.dart';
import 'package:contacts/pages/pageone.dart';
import 'package:contacts/pages/pagetwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'page',
      routes: {
        '/': (context) => const Pageone(),
        'page2': (context) => const Pagetwo(),
        'page': (context) => const Homepage(),
      },
    ),
  );
}
