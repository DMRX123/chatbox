part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {}

class SubmitPicOfDay extends PostEvent {
  final String userId;
  final String imageUrl;
  final String caption;

  const SubmitPicOfDay({
    required this.userId,
    required this.imageUrl,
    required this.caption,
  });

  @override
  List<Object> get props => [userId, imageUrl, caption];
}

class VoteForPic extends PostEvent {
  final String postId;
  final String userId;

  const VoteForPic({
    required this.postId,
    required this.userId,
  });

  @override
  List<Object> get props => [postId, userId];
}