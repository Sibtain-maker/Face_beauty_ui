import 'dart:math';

import 'package:face_beauty_ui/custoum_header.dart';
import 'package:face_beauty_ui/picture_container.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [CustomHeader(), SizedBox(height: 20), PictureContainer()],
        ),
      ),
    );
  }
}
