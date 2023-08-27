import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final String historyId;

  const HistoryScreen({super.key, required this.historyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: const Center(
        child: Text('History Screen'),
      ),
    );
  }
}
