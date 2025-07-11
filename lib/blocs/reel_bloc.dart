import 'package:bloc/bloc.dart';
import 'package:chatbox/models/reel_model.dart';
import 'package:chatbox/repositories/reel_repository.dart';
import 'package:equatable/equatable.dart';

part 'reel_event.dart';
part 'reel_state.dart';

class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final ReelRepository reelRepository;

  ReelBloc({required this.reelRepository}) : super(ReelInitial()) {
    on<LoadReels>(_onLoadReels);
    on<LikeReel>(_onLikeReel);
    on<AddComment>(_onAddComment);
  }

  Future<void> _onLoadReels(
      LoadReels event,
      Emitter<ReelState> emit,
      ) async {
    emit(ReelLoading());
    try {
      final reels = await reelRepository.getReels();
      emit(ReelLoaded(reels));
    } catch (e) {
      emit(ReelError(e.toString()));
    }
  }

  Future<void> _onLikeReel(
      LikeReel event,
      Emitter<ReelState> emit,
      ) async {
    try {
      await reelRepository.likeReel(
        reelId: event.reelId,
        userId: event.userId,
      );
      add(LoadReels());
    } catch (e) {
      emit(ReelError(e.toString()));
    }
  }

  Future<void> _onAddComment(
      AddComment event,
      Emitter<ReelState> emit,
      ) async {
    try {
      await reelRepository.addComment(
        reelId: event.reelId,
        userId: event.userId,
        comment: event.comment,
      );
      add(LoadReels());
    } catch (e) {
      emit(ReelError(e.toString()));
    }
  }
}