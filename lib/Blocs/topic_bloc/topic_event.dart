part of 'topic_bloc.dart';

sealed class TopicEvent extends Equatable {
  const TopicEvent();
}

//Get Event
class GetAllTopicEvent extends TopicEvent {
  @override
  List<Object> get props => [];
}



//Add Note Event
class AddTopicEvent extends TopicEvent {
  final Topic topics;
  const AddTopicEvent(this.topics);
  @override
  List<Object> get props => [topics];
}

//Update Note Event
class UpdateTopicEvent extends TopicEvent {
  final Topic topics;
  const UpdateTopicEvent(this.topics);
  @override
  List<Object> get props => [topics];
}

//Delete Note Event
class DeleteTopicEvent extends TopicEvent {
  final int id;
  const DeleteTopicEvent(this.id);
  @override
  List<Object> get props => [id];
}

//Get Note By ID
class GetTopicByIdEvent extends TopicEvent {
  final int id;
  const GetTopicByIdEvent(this.id);
  @override
  List<Object> get props => [id];
}
