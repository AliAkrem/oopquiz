import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/Models/quiz_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:oopquiz/shared/leave_quiz_dialog.dart';

class QuizDrawer extends StatelessWidget {
  final List<Quiz> quizzes;
  const QuizDrawer({super.key, required this.quizzes});
  @override
  Widget build(BuildContext context) {
    var quizState = Provider.of<QuizProvider>(context);

    final ListQuizzes = quizzes.asMap().entries.map(
      (entry) {
        int index = entry.key;
        var quiz = entry.value;
        return ListTile(
          title: Text(
            '${index + 1}. ${quiz.quizTag}', // Adding index to the quiz tag
          ),
          onTap: () {
            quizState.goToPage(index + 1);
            Scaffold.of(context).closeDrawer();
          },
        );
      },
    ).toList();

    final drawerItems = ListView(
      children: [
        ListTile(
            title: const Text(
              'leave the test',
            ),
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            onTap: () {
              showLeaveAlertDialog(context);
            }),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('Quizzes'),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Divider(
                  height: 18,
                ),
              ),
            ],
          ),
        ),
        ...ListQuizzes
      ],
    );

    return drawerItems;
  }
}
