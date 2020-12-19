import 'package:bmw_design/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

import 'sign_in_flow/auth_state_switch.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    AuthStateSwitch(
      app: CarInfoApp(),
    ),
  );
}
