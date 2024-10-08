import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oopquiz/Blocs/win_animation_bloc/win_animation_bloc.dart';
import 'package:oopquiz/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oopquiz/theme.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WinAnimationBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Java OOP Quiz App',
        theme: appTheme,
        routes: appRoutes,
      ),
    );
  }
}
