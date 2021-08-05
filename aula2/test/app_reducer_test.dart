import 'package:aula2/redux/app_actions.dart';
import 'package:aula2/redux/app_reducer.dart';
import 'package:aula2/redux/app_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('IncrementCounter deve incrementar o counter em 1', () {
    final result = appReducer(
      AppState.initialState(), 
      IncrementCounter(),
    );

    expect(result.counter, equals(1));
  });
}