import 'package:cloud_firestore/cloud_firestore.dart';

class ReelModel {
  final String id;
  final String userId;
  final String videoUrl;
  final String caption;
  final List<String> tags;
  final int likes;
  final int comments;
  final Timestamp timestamp;

  ReelModel({
    required this.id,
    required this.userId,
    required this.videoUrl,
    required this.caption,
    this.tags = const [],
    this.likes = 0,
    this.comments = 0,
    required this.timestamp,
  });

  factory ReelModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReelModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      videoUrl: data['videoUrl'] ?? '',
      caption: data['caption'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
      likes: data['likes'] ?? 0,
      comments: data['comments'] ?? 0,
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'videoUrl': videoUrl,
      'caption': caption,
      'tags': tags,
      'likes': likes,
      'comments': comments,
      'timestamp': timestamp,
    };
  }

  ReelModel copyWith({
    String? id,
    String? userId,
    String? videoUrl,
    String? caption,
    List<String>? tags,
    int? likes,
    int? comments,
    Timestamp? timestamp,
  }) {
    return ReelModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      videoUrl: videoUrl ?? this.videoUrl,
      caption: caption ?? this.caption,
      tags: tags ?? this.tags,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}