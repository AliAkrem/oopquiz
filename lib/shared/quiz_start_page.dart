import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  final Topic topic;

  const StartPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(topic.name, style: Theme.of(context).textTheme.headlineMedium),
          const Divider(),
          Text(topic.description),
          const SizedBox(
            height: 24,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  state.startTimer();
                  
                  state.nextPage();
                },
                label: const Text('Start'),
                icon: const Icon(Icons.play_arrow),
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton.icon(
                onPressed: state.nextPage,
                label: const Text('Dev Start'),
                icon: const Icon(Icons.developer_mode),
              )
            ],
          )
        ],
      ),
    );
  }
}
