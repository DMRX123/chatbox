import 'package:chatbox/models/chat_model.dart';
import 'package:chatbox/services/chat_service.dart';

class ChatRepository {
  final ChatService _chatService;

  ChatRepository({required ChatService chatService})
      : _chatService = chatService;

  Future<List<ChatModel>> getMessages(String userId) async {
    try {
      final messages = await _chatService.getUserMessages(userId);
      return messages;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    try {
      await _chatService.sendMessage(
        senderId: senderId,
        receiverId: receiverId,
        content: content,
      );
    } catch (e) {
      rethrow;
    }
  }
}