import 'package:bloc/bloc.dart';
import 'package:chatbox/models/notification_model.dart';
import 'package:chatbox/repositories/notification_repository.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationBloc({required this.notificationRepository})
      : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkAsRead>(_onMarkAsRead);
  }

  Future<void> _onLoadNotifications(
      LoadNotifications event,
      Emitter<NotificationState> emit,
      ) async {
    emit(NotificationLoading());
    try {
      final notifications = await notificationRepository.getNotifications(
        event.userId,
      );
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> _onMarkAsRead(
      MarkAsRead event,
      Emitter<NotificationState> emit,
      ) async {
    try {
      await notificationRepository.markAsRead(event.notificationId);
      if (state is NotificationLoaded) {
        final notifications = (state as NotificationLoaded)
            .notifications
            .map((n) => n.id == event.notificationId ? n.copyWith(isRead: true) : n)
            .toList();
        emit(NotificationLoaded(notifications));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}