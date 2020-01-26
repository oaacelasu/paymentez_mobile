import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
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
      yield* _mapNumberChangedToState(event.number ?? '');
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name ?? '');
    } else if (event is DateExpChanged) {
      yield* _mapDateExpChangedToState(event.dateExp ?? '');
    }
//    else if (event is AddCardWithGooglePressed) {
//      yield* _mapAddCardWithGooglePressedToState();
//    }
  }

  Stream<AddCardState> _mapNameChangedToState(String name) async* {
    yield state.updateName(
      isNameValid: Validators.isValidName(name),
    );
  }

  Stream<AddCardState> _mapDateExpChangedToState(String dateExp) async* {
    yield state.updateDateExp(
      isDateExpValid: Validators.isValidName(dateExp),
    );
  }

  Stream<AddCardState> _mapNumberChangedToState(String number) async* {
    var cardBin = number.length < 6 ? CardBinModel.fromJson({}) : state.cardBin;
    if (number.length >= 6 && number.length < 11 ||
        number.length >= 6 && state.cardBin == CardBinModel.fromJson({}))
      cardBin = await _paymentezRepository.getCardBin(
          bin: number.substring(0, min(number.length, 10)));

    yield state.updateNumber(
      number: number,
      cardBin: cardBin,
      isNumberValid: Validators.isValidNumber(cardBin?.cardType ?? '',
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
