part of 'topic_bloc.dart';

sealed class TopicState extends Equatable {
  const TopicState();
}

final class TopicInitial extends TopicState {
  @override
  List<Object> get props => [];
}

//Loading State
final class LoadingState extends TopicState {
  @override
  List<Object> get props => [];
}

//Get All Topics
final class LoadedState extends TopicState {
  final List<Topic> allTopics;

  const LoadedState(this.allTopics);
  @override
  List<Object> get props => [allTopics];
}

//In case when there is an error
final class FailureState extends TopicState {
  final String errorMessage;
  const FailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

