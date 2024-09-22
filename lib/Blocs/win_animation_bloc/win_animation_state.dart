part of 'win_animation_bloc.dart';

sealed class WinAnimationState extends Equatable {
  const WinAnimationState();

  @override
  List<Object> get props => [];
}

final class InitialState extends WinAnimationState {
  final isWining = false;
}

final class WiningState extends WinAnimationState {
  final bool isWining = true;
}
