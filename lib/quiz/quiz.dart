import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/shared/shared.dart';

class QuizScreen extends StatefulWidget {
  final Topic topic;

  const QuizScreen({super.key, required this.topic});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      builder: (context, child) {

        var quizState = Provider.of<QuizProvider>(context);
        var quizzes = widget.topic.quizzes;

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(child: AnimatedProgressbar(value: quizState.progress)),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CountDownTimer(
                      duration: 120,
                    ))
              ],
            ),
          ),
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: quizState.controller,
            onPageChanged: (int idx) =>
                quizState.progress = (idx / (quizzes.length + 1)),
            itemBuilder: (BuildContext context, int idx) {
              if (idx == 0) {
                return StartPage(topic: widget.topic);
              } else if (idx == quizzes.length + 1) {
                return CongratsPage(topic: widget.topic);
              } else {
                return QuestionPage(
                  quiz: quizzes[idx - 1],
                  topic: widget.topic,
                );
              }
            },
          ),
          drawer: Drawer(
              child: QuizDrawer(
            quizzes: widget.topic.quizzes,
          )),
        );
  
      },
      // ),
    );
  }
}
