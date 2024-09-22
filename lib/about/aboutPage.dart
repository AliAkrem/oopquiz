import 'package:flutter/material.dart';



class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('about Us'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary
        ),
        body: const Center(
          child: Text('About'),
        ));
  }
}
