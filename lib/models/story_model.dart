import 'package:cloud_firestore/cloud_firestore.dart';

class StoryModel {
  final String id;
  final String userId;
  final String mediaUrl;
  final String mediaType; // image or video
  final Timestamp timestamp;
  final Timestamp expiresAt;
  final List<String> viewers;

  StoryModel({
    required this.id,
    required this.userId,
    required this.mediaUrl,
    required this.mediaType,
    required this.timestamp,
    required this.expiresAt,
    this.viewers = const [],
  });

  factory StoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return StoryModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      mediaUrl: data['mediaUrl'] ?? '',
      mediaType: data['mediaType'] ?? 'image',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      expiresAt: data['expiresAt'] ?? Timestamp.fromDate(DateTime.now().add(const Duration(hours: 24))),
      viewers: List<String>.from(data['viewers'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'mediaUrl': mediaUrl,
      'mediaType': mediaType,
      'timestamp': timestamp,
      'expiresAt': expiresAt,
      'viewers': viewers,
    };
  }

  StoryModel copyWith({
    String? id,
    String? userId,
    String? mediaUrl,
    String? mediaType,
    Timestamp? timestamp,
    Timestamp? expiresAt,
    List<String>? viewers,
  }) {
    return StoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      mediaType: mediaType ?? this.mediaType,
      timestamp: timestamp ?? this.timestamp,
      expiresAt: expiresAt ?? this.expiresAt,
      viewers: viewers ?? this.viewers,
    );
  }
}