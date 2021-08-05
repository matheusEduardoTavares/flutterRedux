import 'package:redux/redux.dart';
import 'app_reducer.dart';
import 'app_state.dart';

Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initialState()
);