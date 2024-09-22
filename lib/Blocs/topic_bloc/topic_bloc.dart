import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oopquiz/DatabaseHelper/repository.dart';
import 'package:oopquiz/Models/topic_model.dart';

part 'topic_event.dart';
part 'topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final Repository repository;

  TopicBloc(this.repository) : super(TopicInitial()) {
    on<GetAllTopicEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final topics = await repository.getAllTopics();
        emit(LoadedState(topics));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
    on<GetTopicByIdEvent>(
      (event, emit) {
        emit(LoadingState());
      },
    );
  }
}
