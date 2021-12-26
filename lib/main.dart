import 'app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: 'Meu downloader',
    primaryColor: Colors.amber.shade100.value,
  ));
  runApp(const App());
}
