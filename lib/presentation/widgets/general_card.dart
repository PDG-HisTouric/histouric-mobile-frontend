import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  final Widget child;

  const GeneralCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: child,
    );
  }
}
