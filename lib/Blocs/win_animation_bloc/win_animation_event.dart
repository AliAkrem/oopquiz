part of 'win_animation_bloc.dart';

sealed class WinAnimationEvent extends Equatable {
  const WinAnimationEvent();

  @override
  List<Object> get props => [];
}

class WinEvent extends WinAnimationEvent {

}


class ResetEvent extends WinAnimationEvent { 
  
}
