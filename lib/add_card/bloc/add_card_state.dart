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
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid =>
      '$nameError$numberError$dateExpError$cvvError'.isEmpty;

  AddCardState({
    @required this.cardBin,
    @required this.numberMaskFormatter,
    @required this.nameError,
    @required this.numberError,
    @required this.dateExpError,
    @required this.cvvError,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  AddCardState empty() {
    return copyWith(
      numberMaskFormatter:
          MaskTextInputFormatter(mask: numberDefaultMask, filter: filter),
      nameError: '',
      numberError: '',
      dateExpError: '',
      cvvError: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  AddCardState loading() {
    return copyWith(
      nameError: '',
      numberError: '',
      dateExpError: '',
      cvvError: '',
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  AddCardState failure() {
    return copyWith(
      nameError: '',
      numberError: '',
      dateExpError: '',
      cvvError: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  AddCardState success() {
    return copyWith(
      nameError: '',
      numberError: '',
      dateExpError: '',
      cvvError: '',
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
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
    );
  }

  AddCardState update({
    String nameError,
    String dateExpError,
    String cvvError,
  }) {
    return copyWith(
      nameError: nameError,
      dateExpError: dateExpError,
      cvvError: cvvError,
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
      isSubmitting: null,
      isSuccess: null,
      isFailure: null);

  AddCardState copyWith({
    CardBinModel cardBin,
    MaskTextInputFormatter numberMaskFormatter,
    String nameError,
    String numberError,
    String dateExpError,
    String cvvError,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return AddCardState(
      cardBin: cardBin ?? this.cardBin,
      numberMaskFormatter: numberMaskFormatter ?? this.numberMaskFormatter,
      nameError: nameError ?? this.nameError,
      numberError: numberError ?? this.numberError,
      dateExpError: dateExpError ?? this.dateExpError,
      cvvError: cvvError ?? this.cvvError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''AddCardState {
      cardBin: $cardBin,
      numberMaskFormatter: ${numberMaskFormatter.getMaskedText()},
      nameError: $nameError,
      numberError: $numberError,
      dateExpError: $dateExpError,
      cvvError: $cvvError,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }

  @override
  List<Object> get props => [
        cardBin,
        numberMaskFormatter,
        nameError,
        numberError,
        dateExpError,
        cvvError,
        isSubmitting,
        isSuccess,
        isFailure
      ];
}
