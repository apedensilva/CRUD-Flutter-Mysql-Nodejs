import 'package:flutter/material.dart';
import 'package:frontend/pages/firstpage.dart';
import 'globals/globals.dart' as globals;

void main() {
  runApp(const Maindart());
}


class Maindart extends StatelessWidget {
  const Maindart({super.key});

  @override
  Widget build(BuildContext context) {

    globals.setDimensions(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height
      );

    return const MaterialApp(
      home: Firstpage(),
    );
  }
}
