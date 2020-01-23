import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  @override
  ConfigState get initialState => DevModeState("", "");


  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    if (event is SetEnvironment) {
      yield* _mapSetEnvironmentToState(event.testMode, event.paymentezClientAppCode, event.paymentezClientAppKey);
    }
  }


  Stream<ConfigState> _mapSetEnvironmentToState(int testMode, String paymentezClientAppCode, String paymentezClientAppKey) async* {
   switch(testMode){
     case 0:
       yield ProdModeState(paymentezClientAppCode, paymentezClientAppKey);
       break;
     case 1:
       yield QaModeState(paymentezClientAppCode, paymentezClientAppKey);
       break;
     case 2:
       yield StgModeState(paymentezClientAppCode, paymentezClientAppKey);

       break;
     case 3:
       yield DevModeState(paymentezClientAppCode, paymentezClientAppKey);
       break;
   }
  }

}
