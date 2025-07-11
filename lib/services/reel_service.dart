import 'package:chatbox/models/reel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ReelModel>> getReels() async {
    try {
      final snapshot = await _firestore
          .collection('reels')
          .orderBy('timestamp', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => ReelModel.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Failed to load reels: \$e');
    }
  }

  Future<void> likeReel({
    required String reelId,
    required String userId,
  }) async {
    try {
      await _firestore
          .collection('reels')
          .doc(reelId)
          .update({
            'likes': FieldValue.increment(1),
            'likedBy': FieldValue.arrayUnion([userId]),
          });
    } catch (e) {
      throw Exception('Failed to like reel: \$e');
    }
  }

  Future<void> addComment({
    required String reelId,
    required String userId,
    required String comment,
  }) async {
    try {
      await _firestore
          .collection('reels')
          .doc(reelId)
          .collection('comments')
          .add({
            'userId': userId,
            'comment': comment,
            'timestamp': Timestamp.now(),
          });
      
      await _firestore
          .collection('reels')
          .doc(reelId)
          .update({
            'comments': FieldValue.increment(1),
          });
    } catch (e) {
      throw Exception('Failed to add comment: \$e');
    }
  }
}