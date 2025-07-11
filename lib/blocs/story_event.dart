part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object> get props => [];
}

class LoadStories extends StoryEvent {}

class AddStory extends StoryEvent {
  final String userId;
  final String mediaUrl;
  final String mediaType;

  const AddStory({
    required this.userId,
    required this.mediaUrl,
    required this.mediaType,
  });

  @override
  List<Object> get props => [userId, mediaUrl, mediaType];
}

class ViewStory extends StoryEvent {
  final String storyId;
  final String userId;

  const ViewStory({
    required this.storyId,
    required this.userId,
  });

  @override
  List<Object> get props => [storyId, userId];
}