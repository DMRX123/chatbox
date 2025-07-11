part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final List<StoryModel> stories;

  const StoryLoaded(this.stories);

  @override
  List<Object> get props => [stories];
}

class StoryError extends StoryState {
  final String message;

  const StoryError(this.message);

  @override
  List<Object> get props => [message];
}