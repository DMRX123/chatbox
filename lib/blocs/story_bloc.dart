import 'package:bloc/bloc.dart';
import 'package:chatbox/models/story_model.dart';
import 'package:chatbox/repositories/story_repository.dart';
import 'package:equatable/equatable.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository storyRepository;

  StoryBloc({required this.storyRepository}) : super(StoryInitial()) {
    on<LoadStories>(_onLoadStories);
    on<AddStory>(_onAddStory);
    on<ViewStory>(_onViewStory);
  }

  Future<void> _onLoadStories(
      LoadStories event,
      Emitter<StoryState> emit,
      ) async {
    emit(StoryLoading());
    try {
      final stories = await storyRepository.getStories();
      emit(StoryLoaded(stories));
    } catch (e) {
      emit(StoryError(e.toString()));
    }
  }

  Future<void> _onAddStory(
      AddStory event,
      Emitter<StoryState> emit,
      ) async {
    try {
      await storyRepository.addStory(
        userId: event.userId,
        mediaUrl: event.mediaUrl,
        mediaType: event.mediaType,
      );
      add(LoadStories());
    } catch (e) {
      emit(StoryError(e.toString()));
    }
  }

  Future<void> _onViewStory(
      ViewStory event,
      Emitter<StoryState> emit,
      ) async {
    try {
      await storyRepository.viewStory(
        storyId: event.storyId,
        userId: event.userId,
      );
      add(LoadStories());
    } catch (e) {
      emit(StoryError(e.toString()));
    }
  }
}