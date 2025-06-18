import 'package:face_beauty_ui/custoum_header.dart';
import 'package:flutter/material.dart';

class FaceBeautyUi extends StatefulWidget {
  const FaceBeautyUi({super.key});

  @override
  State<FaceBeautyUi> createState() => _FaceBeautyUiState();
}

class _FaceBeautyUiState extends State<FaceBeautyUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[CustomHeader()],
        ),
      ),
    );
  }
}
