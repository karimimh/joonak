import 'package:dio/dio.dart';
import 'package:flame/game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Dio client can be constructed', () {
    expect(Dio(), isA<Dio>());
  });

  test('Flame game can be constructed', () {
    expect(FlameGame(), isA<FlameGame>());
  });
}
