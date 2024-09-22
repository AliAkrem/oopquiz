import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'win_animation_event.dart';
part 'win_animation_state.dart';

class WinAnimationBloc extends Bloc<WinAnimationEvent, WinAnimationState> {
  WinAnimationBloc() : super(InitialState()) {
    on<WinEvent>(
      (event, emit) {
        emit(WiningState());

        Future.delayed(const Duration(seconds: 4), () {
          add(ResetEvent());
        });
      },
    );

    on<ResetEvent>((event, emit) {
      emit(InitialState());
    });
  }
}
