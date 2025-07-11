import 'package:flutter/material.dart';

class ReelScreen extends StatelessWidget {
  const ReelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Reel'),
      ),
      body: const Center(
        child: Text('Reel Creation Screen'),
      ),
    );
  }
}