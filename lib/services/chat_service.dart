import 'package:chatbox/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ChatModel>> getUserMessages(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('chats')
          .where('receiverId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .get();
      
      return snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Failed to load messages: \$e');
    }
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    try {
      await _firestore.collection('chats').add({
        'senderId': senderId,
        'receiverId': receiverId,
        'content': content,
        'timestamp': Timestamp.now(),
        'isRead': false,
      });
    } catch (e) {
      throw Exception('Failed to send message: \$e');
    }
  }
}