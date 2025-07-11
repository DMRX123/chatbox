part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends ChatEvent {
  final String userId;

  const LoadMessages(this.userId);

  @override
  List<Object> get props => [userId];
}

class SendMessage extends ChatEvent {
  final String senderId;
  final String receiverId;
  final String content;

  const SendMessage({
    required this.senderId,
    required this.receiverId,
    required this.content,
  });

  @override
  List<Object> get props => [senderId, receiverId, content];
}

class MessageReceived extends ChatEvent {
  final ChatModel message;

  const MessageReceived(this.message);

  @override
  List<Object> get props => [message];
}