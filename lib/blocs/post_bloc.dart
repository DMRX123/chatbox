import 'package:bloc/bloc.dart';
import 'package:chatbox/models/post_model.dart';
import 'package:chatbox/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<SubmitPicOfDay>(_onSubmitPicOfDay);
    on<VoteForPic>(_onVoteForPic);
  }

  Future<void> _onLoadPosts(
      LoadPosts event,
      Emitter<PostState> emit,
      ) async {
    emit(PostLoading());
    try {
      final posts = await postRepository.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _onSubmitPicOfDay(
      SubmitPicOfDay event,
      Emitter<PostState> emit,
      ) async {
    emit(PostLoading());
    try {
      await postRepository.submitPost(
        userId: event.userId,
        imageUrl: event.imageUrl,
        caption: event.caption,
      );
      add(LoadPosts());
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _onVoteForPic(
      VoteForPic event,
      Emitter<PostState> emit,
      ) async {
    try {
      await postRepository.voteForPost(
        postId: event.postId,
        userId: event.userId,
      );
      add(LoadPosts());
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}