import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/components/play_game_button.dart';
import 'package:my_app/components/select_game_mode_button.dart';
import 'package:my_app/state/game_settings_state_norifier.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        builder: (context, ref, _) {
          final gameSettingsState = ref.watch(gameSettingProvider);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("スワイプゲーム"),
              const SizedBox(height: 50),
              SelectGameModeButton(),
              PlayGameButton(),
            ],
          );
        },
      ),
    );
  }
}
