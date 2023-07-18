import 'package:flutter/material.dart';

import 'package:crltsmrtnz/pages/nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: const SafeArea(
          child: Center(
            // Este Widget de texto usará la fuente RobotoMono
            child: Text(
              'CrltsMrtnz migrate',
            ),
          ),
        ),
      );
}
