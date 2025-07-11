import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String userId;
  final String imageUrl;
  final String caption;
  final int votes;
  final Timestamp timestamp;
  final String? contestLevel; // day, week, month, year

  PostModel({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.caption,
    this.votes = 0,
    required this.timestamp,
    this.contestLevel,
  });

  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PostModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      caption: data['caption'] ?? '',
      votes: data['votes'] ?? 0,
      timestamp: data['timestamp'] ?? Timestamp.now(),
      contestLevel: data['contestLevel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'imageUrl': imageUrl,
      'caption': caption,
      'votes': votes,
      'timestamp': timestamp,
      'contestLevel': contestLevel,
    };
  }

  PostModel copyWith({
    String? id,
    String? userId,
    String? imageUrl,
    String? caption,
    int? votes,
    Timestamp? timestamp,
    String? contestLevel,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      votes: votes ?? this.votes,
      timestamp: timestamp ?? this.timestamp,
      contestLevel: contestLevel ?? this.contestLevel,
    );
  }
}