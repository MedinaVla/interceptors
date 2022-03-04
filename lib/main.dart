import 'package:flutter/material.dart';
import 'package:interceptors/services/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  bootstrap(() => const App());
}
