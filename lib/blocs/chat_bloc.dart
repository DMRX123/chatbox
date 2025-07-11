import 'package:bloc/bloc.dart';
import 'package:chatbox/models/chat_model.dart';
import 'package:chatbox/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({required this.chatRepository}) : super(ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<MessageReceived>(_onMessageReceived);
  }

  Future<void> _onLoadMessages(
      LoadMessages event,
      Emitter<ChatState> emit,
      ) async {
    emit(ChatLoading());
    try {
      final messages = await chatRepository.getMessages(event.userId);
      emit(ChatLoaded(messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onSendMessage(
      SendMessage event,
      Emitter<ChatState> emit,
      ) async {
    try {
      await chatRepository.sendMessage(
        senderId: event.senderId,
        receiverId: event.receiverId,
        content: event.content,
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void _onMessageReceived(
      MessageReceived event,
      Emitter<ChatState> emit,
      ) {
    if (state is ChatLoaded) {
      final messages = [...(state as ChatLoaded).messages, event.message];
      emit(ChatLoaded(messages));
    }
  }
}