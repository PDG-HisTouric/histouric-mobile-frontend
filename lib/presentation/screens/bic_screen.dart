import 'package:flutter/material.dart';

class BICScreen extends StatelessWidget {
  final String bicId;

  const BICScreen({super.key, required this.bicId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIC Screen'),
      ),
      body: Center(
        child: Text('BIC Screen: $bicId'),
      ),
    );
  }
}
