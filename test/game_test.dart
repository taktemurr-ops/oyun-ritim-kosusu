import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ritim_kosusu/oyun_ritim_kosusu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ritimKosusuConfig.title.length, 33);
    expect(ritimKosusuConfig.tagline.length, 33);
    for (final s in ritimKosusuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ritimKosusuConfig.gameId, ritimKosusuId);
    expect(ritimKosusuRules.gameId, ritimKosusuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ritimKosusuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ritimKosusuId, optionalMechanics: ritimKosusuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ritimKosusuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
