import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/state/game_settings_state_norifier.dart';

class SelectGameModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final gameSettingState = ref.watch(gameSettingProvider);

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ref
                  .read(gameSettingProvider.notifier)
                  .switchGameMode(GameMode.tenSeconds);
            },
            child: Text("10秒モード"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(gameSettingProvider.notifier)
                  .switchGameMode(GameMode.twentyCards);
            },
            child: Text("20枚モード"),
          ),
          Text(gameSettingState.mode == GameMode.tenSeconds
              ? "10秒モード"
              : "20枚モード"),
        ],
      );
    });
  }
}
