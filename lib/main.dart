import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/Blocs/win_animation_bloc/win_animation_bloc.dart';
import 'package:oopquiz/routes.dart';
import 'package:oopquiz/services/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oopquiz/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // final initFuture = MobileAds.instance.initialize();

  // final adState = AdState(initFuture);

  // runApp(Provider.value(
  //   value: adState,
  //   builder: (context, child) => const MyApp(),
  // ));

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
        title: 'Quiz App',
        theme: appTheme,
        routes: appRoutes,
      ),
    );
  }
}
