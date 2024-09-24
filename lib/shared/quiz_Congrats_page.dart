import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oopquiz/Blocs/win_animation_bloc/win_animation_bloc.dart';
import 'package:oopquiz/Models/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class CongratsPage extends StatelessWidget {
  final Topic topic;
  const CongratsPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congrats! You completed the ${topic.name} quiz',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Image.asset('assets/congrats.gif'),
          const Divider(),
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            icon: const Icon(FontAwesomeIcons.check),
            label: const Text('Mark Complete!'),
            onPressed: () {
              context.read<WinAnimationBloc>().add(WinEvent());

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
