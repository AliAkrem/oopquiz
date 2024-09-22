import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oopquiz/DatabaseHelper/repository.dart';
import 'package:oopquiz/Models/quiz_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final Repository repository = Repository();

  QuizBloc() : super(QuizInitial()) {
    on<GetAllQuizEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final quizzes = await repository.getAllQuizzes(topicId: event.topicId);
        emit(LoadedState(quizzes));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });

    on<CorrectQuizAnswerEvent>(
      (event, emit) async {
        await repository.quizAnswered(
            quiz: event.quiz);
      },
    );
  }
}
