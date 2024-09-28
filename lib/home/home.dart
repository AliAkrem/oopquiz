import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oopquiz/Blocs/win_animation_bloc/win_animation_bloc.dart';
import 'package:oopquiz/shared/shared.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WinAnimationBloc, WinAnimationState>(
          builder: (context, state) {
            return WinAnimationProvider(
              show: state is WiningState,
              child: const Expanded(child: TopicList()),
            );
          },
        ),
      ),
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
    );
  }
}
