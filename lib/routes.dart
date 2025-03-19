import 'package:oopquiz/about/about_page.dart';
import 'package:oopquiz/credit/credit_page.dart';
import 'package:oopquiz/home/home.dart';

var appRoutes = {
  '/': (context) => const HomePage(),
  '/about': (context) => const AboutPage(),
  '/credit': (context) => const CreditsPage(),
};
