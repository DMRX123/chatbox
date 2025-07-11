import 'package:flutter/material.dart';
import 'package:chatbox/widgets/common/bottom_nav_bar.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels'),
      ),
      body: const Center(
        child: Text('Reels Screen Content'),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}