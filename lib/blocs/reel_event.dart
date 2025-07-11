part of 'reel_bloc.dart';

abstract class ReelEvent extends Equatable {
  const ReelEvent();

  @override
  List<Object> get props => [];
}

class LoadReels extends ReelEvent {}

class LikeReel extends ReelEvent {
  final String reelId;
  final String userId;

  const LikeReel({required this.reelId, required this.userId});

  @override
  List<Object> get props => [reelId, userId];
}

class AddComment extends ReelEvent {
  final String reelId;
  final String userId;
  final String comment;

  const AddComment({
    required this.reelId,
    required this.userId,
    required this.comment,
  });

  @override
  List<Object> get props => [reelId, userId, comment];
}