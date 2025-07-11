import 'package:flutter/material.dart';
import 'package:chatbox/widgets/posts/post_card.dart';

class PicContestScreen extends StatelessWidget {
  const PicContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pic of the Day'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const PostCard();
        },
      ),
    );
  }
}