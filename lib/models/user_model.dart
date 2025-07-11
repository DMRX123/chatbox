import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final List<String> badges;
  final int followers;
  final int following;
  final String? role;
  final String? zone;
  final Timestamp createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.badges = const [],
    this.followers = 0,
    this.following = 0,
    this.role,
    this.zone,
    required this.createdAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImage: data['profileImage'],
      badges: List<String>.from(data['badges'] ?? []),
      followers: data['followers'] ?? 0,
      following: data['following'] ?? 0,
      role: data['role'],
      zone: data['zone'],
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'badges': badges,
      'followers': followers,
      'following': following,
      'role': role,
      'zone': zone,
      'createdAt': createdAt,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    List<String>? badges,
    int? followers,
    int? following,
    String? role,
    String? zone,
    Timestamp? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      badges: badges ?? this.badges,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      role: role ?? this.role,
      zone: zone ?? this.zone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}