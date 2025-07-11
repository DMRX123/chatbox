import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final int posts;
  final int followers;
  final int following;

  const StatsRow({
    super.key,
    required this.posts,
    required this.followers,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatColumn(posts, 'Posts'),
        _buildStatColumn(followers, 'Followers'),
        _buildStatColumn(following, 'Following'),
      ],
    );
  }

  Widget _buildStatColumn(int count, String label) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}