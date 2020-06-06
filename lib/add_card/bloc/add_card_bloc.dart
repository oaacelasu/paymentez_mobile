import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:paymentez_mobile/add_card/bloc/bloc.dart';
import 'package:paymentez_mobile/channel/paymentez_channel.dart';
import 'package:paymentez_mobile/repository/model/card_bin_model.dart';
import 'package:paymentez_mobile/repository/model/card_model.dart';
import 'package:paymentez_mobile/repository/model/error_model.dart';
import 'package:paymentez_mobile/repository/model/user.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';
import 'package:paymentez_mobile/utils/validators.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  PaymentezRepository _paymentezRepository;

  AddCardBloc({
    @required PaymentezRepository paymentezRepository,
  })  : assert(paymentezRepository != null),
        _paymentezRepository = paymentezRepository;

  @override
  AddCardState get initialState => AddCardState.fromJson({}).empty();

//  @override
//  Stream<AddCardState> transformEvents(
//    Stream<AddCardEvent> events,
//    Stream<AddCardState> Function(AddCardEvent event) next,
//  ) {
//    final nonDebounceStream = events.where((event) {
//      return (event is! NameChanged && event is! CvvChanged);
//    });
//    final debounceStream = events.where((event) {
//      return (event is NameChanged || event is CvvChanged);
//    }).debounceTime(Duration(milliseconds: 300));
//    return super.transformEvents(
//      nonDebounceStream.mergeWith([debounceStream]),
//      next,
//    );
//  }

  @override
  Stream<AddCardState> mapEventToState(AddCardEvent event) async* {
    print('holassss: ${_paymentezRepository.configState.isFlutterAppHost}');
    if (event is NumberChanged) {
      yield* _mapNumberChangedToState(event.context, event.number ?? '');
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.context, event.name ?? '');
    } else if (event is DateExpChanged) {
      yield* _mapDateExpChangedToState(event.context, event.dateExp ?? '');
    } else if (event is CvvChanged) {
      yield* _mapCvvChangedToState(event.context, event.cvv ?? '');
    } else if (event is FiscalNumberChanged) {
      yield* _mapFiscalNumberChangedToState(
          event.context, event.fiscalNumber ?? '');
    } else if (event is TuyaCodeChanged) {
      yield* _mapTuyaCodeChangedToState(event.context, event.tuyaCode ?? '');
    } else if (event is Submitted) {
      yield* _mapSummitedToState(event.context,
          sessionId: '', card: event.card);
    }
  }

  Stream<AddCardState> _mapNameChangedToState(
      BuildContext context, String name) async* {
    yield state.update(
      nameError: Validators.isValidName(context, name),
    );
  }

  Stream<AddCardState> _mapDateExpChangedToState(
      BuildContext context, String dateExp) async* {
    yield state.update(
      dateExpError: Validators.isValidDateExp(context, dateExp),
    );
  }

  Stream<AddCardState> _mapCvvChangedToState(
      BuildContext context, String cvv) async* {
    yield state.update(
        cvvError:
            Validators.isValidCVV(context, cvv, state.cardBin?.cvvLength));
  }

  Stream<AddCardState> _mapFiscalNumberChangedToState(
      BuildContext context, String fiscalNumber) async* {
    yield state.update(
      fiscalNumberError: Validators.isValidFiscalNumber(context, fiscalNumber),
    );
  }

  Stream<AddCardState> _mapTuyaCodeChangedToState(
      BuildContext context, String tuyaCode) async* {
    yield state.update(
      tuyaCodeError: Validators.isValidTuyaCode(context, tuyaCode),
    );
  }

  Stream<AddCardState> _mapNumberChangedToState(
      BuildContext context, String number) async* {
    var cardBin = number.length < 6 ? CardBinModel.fromJson({}) : state.cardBin;
    if (number.length >= 6 && number.length < 11 ||
        number.length >= 6 && state.cardBin == CardBinModel.fromJson({}))
      cardBin = await _paymentezRepository.getCardBin(
          bin: number.substring(0, min(number.length, 10)));

    yield state.updateNumber(
      number: number,
      cardBin: cardBin,
      numberError: Validators.isValidNumber(
          context,
          cardBin?.cardType ?? '',
          number ?? '',
          cardBin?.cardMask ?? AddCardState.numberDefaultMask,
          cardBin?.useLuhn ?? true),
    );
  }

  Stream<AddCardState> _mapSummitedToState(
    BuildContext context, {
    String sessionId,
    User user,
    CardModel card,
  }) async* {
    yield state.loading();
    try {
      var response = await _paymentezRepository.createToken(context,
          sessionId: sessionId, card: card);
      print('the request est returned');

      var result = CardModel.fromJson(response.data['card' ?? {}]);
      print('the request est ok');
      yield state.success(result);
      Future.delayed(Duration(seconds: 2), () {
        if (_paymentezRepository.configState.isFlutterAppHost)
          _paymentezRepository.successAction(result);
        else
          Paymentez.getInstance.deliverAddCardResponse(context, result);
      });
    } on DioError catch (e) {
      var result = ErrorModel.fromJson(e.response.data['error']);
      yield state.failure(result);
      Future.delayed(Duration(seconds: 2), () {
        if (_paymentezRepository.configState.isFlutterAppHost)
          _paymentezRepository.errorAction(result);
        else
          Paymentez.getInstance.deliverAddCardResponse(context, result);
      });
    }
  }
}
