import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

enum GameMode {
  tenSeconds,
  twentyCards,
}

class GameSetting {
  bool isAwkward = false;
  bool isGame = false;
  GameMode mode = GameMode.tenSeconds;

  GameSetting(
      {this.isAwkward = false,
      this.mode = GameMode.tenSeconds,
      this.isGame = false});

  GameSetting copyWith({bool? isAwkward, GameMode? mode, bool? isGame}) {
    return GameSetting(
        isAwkward: isAwkward ?? false,
        mode: mode ?? GameMode.tenSeconds,
        isGame: isGame ?? false);
  }
}

class GameSettingsNotifier extends StateNotifier<GameSetting> {
  GameSettingsNotifier() : super(GameSetting());

  void switchIsAwkward(bool isAwkward) {
    state = GameSetting(isAwkward: !isAwkward);
  }

  void switchGameMode(GameMode mode) {
    state = GameSetting(mode: mode);
  }
}

final gameSettingProvider =
    StateNotifierProvider<GameSettingsNotifier, GameSetting>(
        (ref) => GameSettingsNotifier());
