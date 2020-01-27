import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:paymentez_mobile/repository/model/card_bin_model.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';
import 'package:paymentez_mobile/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

import 'add_card_event.dart';
import 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  PaymentezRepository _paymentezRepository;

  AddCardBloc({
    @required PaymentezRepository paymentezRepository,
  })  : assert(paymentezRepository != null),
        _paymentezRepository = paymentezRepository;

  @override
  AddCardState get initialState => AddCardState.fromJson({}).empty();

  @override
  Stream<AddCardState> transformEvents(
    Stream<AddCardEvent> events,
    Stream<AddCardState> Function(AddCardEvent event) next,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! NumberChanged);
    });
    final debounceStream = events.where((event) {
      return (event is NumberChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<AddCardState> mapEventToState(AddCardEvent event) async* {
    if (event is NumberChanged) {
      yield* _mapNumberChangedToState(event.context, event.number ?? '');
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.context, event.name ?? '');
    } else if (event is DateExpChanged) {
      yield* _mapDateExpChangedToState(event.context, event.dateExp ?? '');
    } else if (event is CvvChanged) {
      yield* _mapCvvChangedToState(event.context, event.cvv ?? '');
    }
//    else if (event is AddCardWithGooglePressed) {
//      yield* _mapAddCardWithGooglePressedToState();
//    }
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
      numberError: Validators.isValidNumber(context, cardBin?.cardType ?? '',
          number ?? '', cardBin?.cardMask ?? AddCardState.numberDefaultMask),
    );
  }

//  Stream<AddCardState> _mapAddCardWithCredentialsPressedToState({
//    String email,
//    String password,
//  }) async* {
//    yield AddCardState.loading();
//    try {
//      await _paymentezRepository.signInWithCredentials(email, password);
//      yield AddCardState.success();
//    } catch (_) {
//      yield AddCardState.failure();
//    }
//  }
}
