// library
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// pages
import 'package:my_app/pages/game.dart';
import 'package:my_app/pages/main_menu.dart';
// state
import 'package:my_app/state/game_settings_state_norifier.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: BaseWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final gameSettingState = ref.watch(gameSettingProvider);

      return Scaffold(
        body: gameSettingState.isGame ? Game() : MainMenu(),
      );
    });
  }
}
