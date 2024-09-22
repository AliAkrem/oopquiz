import 'package:flutter/material.dart';
import 'package:oopquiz/data/topics.dart';
import 'package:oopquiz/shared/shared.dart';

class TopicList extends StatefulWidget {
  const TopicList({super.key});
  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var topic in topics) {
      widgets.add(TopicItem(topic: topic));
    }

    return GridView.count(crossAxisCount: (1),childAspectRatio: 1.4,  children: widgets);
  }
}
