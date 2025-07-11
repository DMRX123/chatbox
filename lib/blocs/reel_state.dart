part of 'reel_bloc.dart';

abstract class ReelState extends Equatable {
  const ReelState();

  @override
  List<Object> get props => [];
}

class ReelInitial extends ReelState {}

class ReelLoading extends ReelState {}

class ReelLoaded extends ReelState {
  final List<ReelModel> reels;

  const ReelLoaded(this.reels);

  @override
  List<Object> get props => [reels];
}

class ReelError extends ReelState {
  final String message;

  const ReelError(this.message);

  @override
  List<Object> get props => [message];
}