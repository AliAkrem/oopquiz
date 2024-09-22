part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  const QuizState();
}

final class QuizInitial extends QuizState {
  @override
  List<Object> get props => [];
}

//Loading State
final class LoadingState extends QuizState {
  @override
  List<Object> get props => [];
}

//Get All Quizzes
final class LoadedState extends QuizState {
  final List<Quiz> allQuizzes;
  const LoadedState(this.allQuizzes);
  @override
  List<Object> get props => [allQuizzes];
}

//In case when there is an error
final class FailureState extends QuizState {
  final String errorMessage;
  const FailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

