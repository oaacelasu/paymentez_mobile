import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:paymentez_mobile/config/bloc.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  @override
  ConfigState get initialState =>
      StgModeState("JVA-CO-CLIENT", "v3Ew8H8csSXxaf2IvvmuLnnB0nPmT0", false);

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    if (event is SetEnvironment) {
      yield* _mapSetEnvironmentToState(
          event.testMode,
          event.paymentezClientAppCode,
          event.paymentezClientAppKey,
          event.isFlutterAppHost);
    }
  }

  Stream<ConfigState> _mapSetEnvironmentToState(
      String testMode,
      String paymentezClientAppCode,
      String paymentezClientAppKey,
      bool isFlutterAppHost) async* {
    switch (testMode.toLowerCase()) {
      case 'prod':
        yield ProdModeState(
            paymentezClientAppCode, paymentezClientAppKey, isFlutterAppHost,
            initiated: true);
        break;
      case 'qa':
        yield QaModeState(
            paymentezClientAppCode, paymentezClientAppKey, isFlutterAppHost,
            initiated: true);
        break;
      case 'stg':
        yield StgModeState(
            paymentezClientAppCode, paymentezClientAppKey, isFlutterAppHost,
            initiated: true);
        break;
      case 'dev':
        yield DevModeState(
            paymentezClientAppCode, paymentezClientAppKey, isFlutterAppHost,
            initiated: true);
        break;
      default:
        yield DevModeState(
            paymentezClientAppCode, paymentezClientAppKey, isFlutterAppHost,
            initiated: true);
    }
  }
}
