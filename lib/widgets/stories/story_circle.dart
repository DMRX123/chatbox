import 'package:flutter/material.dart';
import 'package:chatbox/config/theme.dart';

class StoryCircle extends StatelessWidget {
  final String? imageUrl;
  final bool hasUnseen;
  final double size;
  final VoidCallback onTap;

  const StoryCircle({
    super.key,
    this.imageUrl,
    this.hasUnseen = false,
    this.size = 64,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: hasUnseen
              ? const LinearGradient(
                  colors: [AppTheme.primaryColor, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl!)
                : const AssetImage('assets/images/profile/default.png') as ImageProvider,
          ),
        ),
      ),
    );
  }
}