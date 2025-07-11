import 'package:flutter/material.dart';
import 'package:chatbox/config/theme.dart';

class PinnedUserCard extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final bool isOnline;

  const PinnedUserCard({
    super.key,
    required this.name,
    this.imageUrl,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl!)
                : const AssetImage('assets/images/profile/default.png') as ImageProvider,
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        isOnline ? 'Online' : 'Offline',
        style: TextStyle(
          color: isOnline ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }
}