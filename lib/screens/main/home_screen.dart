import 'package:flutter/material.dart';
import 'package:chatbox/widgets/common/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen Content'),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }
}