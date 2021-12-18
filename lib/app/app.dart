import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return const MaterialApp(
      home: Home(),
    );
  }
}
