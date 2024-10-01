import 'package:markdown_widget/markdown_widget.dart';
import 'package:oopquiz/Models/quiz_model.dart';
import 'package:oopquiz/Models/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:oopquiz/shared/answer.dart';
import 'package:oopquiz/shared/shared.dart';
import 'package:oopquiz/utils/build_markdown.dart';

class QuestionPage extends StatefulWidget {
  final int questionIndex;
  final Quiz quiz;
  final Topic topic;
  const QuestionPage(
      {super.key,
      required this.quiz,
      required this.topic,
      required this.questionIndex});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // This ensures the widget is kept alive

  // bool isAnswersShowed = false;
  // void showAnswers() {
  //   setState(() {
  //     isAnswersShowed = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(
          flex: 1,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              alignment: Alignment.center,
              child: buildMarkdown(context, widget.quiz.questionContent)),
        ),
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ...widget.quiz.answers.map<Widget>((opt) {
                          return Expanded(
                            child: Answer(
                              questionIndex: widget.questionIndex,
                              option: opt,
                              quiz: widget.quiz,
                            ),
                          );
                        }),
                      ])),
              // (!isAnswersShowed)
              //       ? Positioned.fill(
              //           child: ClipRect(
              //             child: BackdropFilter(
              //               filter: ImageFilter.blur(
              //                   sigmaX: 2.0, sigmaY: 2.0), // Blur effect
              //               child: Container(
              //                 color: Colors.black
              //                     .withOpacity(0.3), // Optional color overlay
              //                 child: Center(
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       const Text(
              //                         'Answers will be displayed after...',
              //                         style: TextStyle(
              //                             color: Colors.white, fontSize: 20),
              //                       ),
              //                       // You can add a countdown timer or any other widget here
              //                       QuestionCountDownTimer(
              //                         idx: widget.questionIndex,
              //                         showAnswers: showAnswers,
              //                         duration: 30,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         )
              //       : Container(),
            ],
          ),
        )
      ]),
    );
  }
}

class ExamplePage extends StatefulWidget {
  final Quiz quiz;
  final Topic topic;
  const ExamplePage({super.key, required this.quiz, required this.topic});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(
          flex: 1,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              alignment: Alignment.center,
              child: buildMarkdown(context, widget.quiz.questionContent)),
        ),
        // ignore: prefer_const_constructors
      ]),
    );
  }
}
