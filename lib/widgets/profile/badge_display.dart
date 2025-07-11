import 'package:flutter/material.dart';
import 'package:chatbox/config/theme.dart';

class BadgeDisplay extends StatelessWidget {
  final String badgeId;
  final double size;

  const BadgeDisplay({
    super.key,
    required this.badgeId,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    // In a real app, you would fetch the badge SVG/icon based on badgeId
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.star,
          color: Colors.white,
          size: size * 0.6,
        ),
      ),
    );
  }
}