import 'package:equatable/equatable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meta/meta.dart';
import 'package:paymentez_mobile/repository/model/card_bin_model.dart';

@immutable
class AddCardState extends Equatable {
  static const String numberDefaultMask = 'XXXX XXXX XXXX XXXX';
  static final Map<String, RegExp> filter = {"X": RegExp(r'[0-9]')};

  final CardBinModel cardBin;
  final MaskTextInputFormatter numberMaskFormatter;
  final String nameError;
  final String numberError;
  final String dateExpError;
  final String cvvError;
  final String fiscalNumberError;
  final String tuyaCodeError;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final dynamic response;

  bool get isFormValid =>
      '$nameError$numberError$dateExpError$cvvError'.isEmpty;

  bool get isTuyaFormValid =>
      '$nameError$numberError$fiscalNumberError$tuyaCodeError'.isEmpty;

  AddCardState({
    @required this.cardBin,
    @required this.numberMaskFormatter,
    @required this.nameError,
    @required this.numberError,
    @required this.dateExpError,
    @required this.cvvError,
    @required this.fiscalNumberError,
    @required this.tuyaCodeError,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.response,
  });

  AddCardState empty() {
    return copyWith(
      numberMaskFormatter:
          MaskTextInputFormatter(mask: numberDefaultMask, filter: filter),
      cardBin: CardBinModel.fromJson({}),
      nameError: ' ',
      numberError: ' ',
      dateExpError: ' ',
      cvvError: ' ',
      fiscalNumberError: ' ',
      tuyaCodeError: ' ',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      response: null,
    );
  }

  AddCardState loading() {
    return copyWith(
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      response:''
    );
  }

  AddCardState failure(dynamic response) {
    return copyWith(
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      response:response,
    );
  }

  AddCardState success(dynamic response) {
    return copyWith(
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      response:response,
    );
  }

  AddCardState updateNumber({
    String number,
    CardBinModel cardBin,
    String numberError,
  }) {
    var newNumberMaskFormatter =
        MaskTextInputFormatter(mask: numberDefaultMask, filter: filter);

    if (number.isNotEmpty && numberMaskFormatter != null)
      newNumberMaskFormatter = numberMaskFormatter;

    if (cardBin != null)
      newNumberMaskFormatter.updateMask(cardBin.cardMask ?? numberDefaultMask);

    return copyWith(
      cardBin: cardBin,
      numberMaskFormatter: newNumberMaskFormatter,
      numberError: numberError,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      response:'',
    );
  }

  AddCardState update(
      {String nameError,
      String dateExpError,
      String cvvError,
      String fiscalNumberError,
      String tuyaCodeError}) {
    return copyWith(
      nameError: nameError,
      dateExpError: dateExpError,
      cvvError: cvvError,
      fiscalNumberError: fiscalNumberError,
      tuyaCodeError: tuyaCodeError,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory AddCardState.fromJson(Map<String, dynamic> json) => AddCardState(
      cardBin: null,
      numberMaskFormatter: null,
      nameError: null,
      numberError: null,
      dateExpError: null,
      cvvError: null,
      fiscalNumberError: null,
      tuyaCodeError: null,
      isSubmitting: null,
      isSuccess: null,
      isFailure: null, response: null);

  AddCardState copyWith({
    CardBinModel cardBin,
    MaskTextInputFormatter numberMaskFormatter,
    String nameError,
    String numberError,
    String dateExpError,
    String cvvError,
    String fiscalNumberError,
    String tuyaCodeError,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    dynamic response,
  }) {
    return AddCardState(
      cardBin: cardBin ?? this.cardBin,
      numberMaskFormatter: numberMaskFormatter ?? this.numberMaskFormatter,
      nameError: nameError ?? this.nameError,
      numberError: numberError ?? this.numberError,
      dateExpError: dateExpError ?? this.dateExpError,
      cvvError: cvvError ?? this.cvvError,
      fiscalNumberError: fiscalNumberError ?? this.fiscalNumberError,
      tuyaCodeError: tuyaCodeError ?? this.tuyaCodeError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      response: response ?? this.response
    );
  }

  @override
  String toString() {
    return '''AddCardState {
      cardBin: $cardBin,
      numberMaskFormatter: ${numberMaskFormatter?.getMaskedText()},
      nameError: $nameError,
      numberError: $numberError,
      dateExpError: $dateExpError,
      cvvError: $cvvError,
      fiscalNumberError: $fiscalNumberError, 
      tuyaCodeError: $tuyaCodeError,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      response: $response
    }''';
  }

  @override
  List<Object> get props => [
        cardBin,
        numberMaskFormatter,
        nameError,
        numberError,
        dateExpError,
        fiscalNumberError,
        tuyaCodeError,
        cvvError,
        isSubmitting,
        isSuccess,
        isFailure,
    response
      ];
}
