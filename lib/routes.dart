import 'package:oopquiz/about/aboutPage.dart';
import 'package:oopquiz/credit/creditPage.dart';
import 'package:oopquiz/home/home.dart';

var appRoutes = {
  '/': (context) => const HomePage(),
  '/about': (context) => const AboutPage(),
  '/credit': (context) => const CreditsPage(),
};
