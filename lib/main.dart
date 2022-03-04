import 'package:flutter/material.dart';
import 'package:interceptors/boostrap.dart';
import 'package:interceptors/services/locator.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  bootstrap(() => const App());
}
