import 'package:downloader/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // optional: set false to disable printing logs to console
  await FlutterDownloader.initialize(debug: false);

  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: 'Meu downloader',
    primaryColor: Colors.amber.shade100.value,
  ));
  runApp(const App());
}
