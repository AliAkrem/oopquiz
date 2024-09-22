part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

//Get ALL Quiz of Specific topic Event
class GetAllQuizEvent extends QuizEvent {
  final int topicId;

  const GetAllQuizEvent({required this.topicId});

  @override
  List<Object> get props => [];
}

class CorrectQuizAnswerEvent extends QuizEvent {
  final Quiz quiz;
  const CorrectQuizAnswerEvent({required this.quiz});
  @override
  List<Object> get props => [quiz];
}
