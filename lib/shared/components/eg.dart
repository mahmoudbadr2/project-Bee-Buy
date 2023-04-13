import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final String mallName;

  const NextScreen({required this.mallName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mallName),
      ),
      body: Center(
        child: Text('This is the $mallName '),
      ),
    );
  }
}

