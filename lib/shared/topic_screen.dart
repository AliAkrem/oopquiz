import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/quiz/quiz.dart';
import 'package:flutter/material.dart';
import 'package:oopquiz/utils/constants.dart';

class TopicScreen extends StatefulWidget {
  final Topic topic;

  const TopicScreen({super.key, required this.topic});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.topic.name),
      ),
      body: ListView(children: [
        Hero(
          tag: widget.topic.imagePath,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: charcoalColor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 12) * 4,
              child: Center(
                child: Image.asset(
                  "assets/topics/${widget.topic.imagePath}",
                  height: 50 * 2,
                  width: 100 * 2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: () {


              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => QuizScreen(
                            topic: widget.topic,
                          )));
            },
            child: const Text("start now"),
          ),
        ),
      ]),
    );
  }
}


