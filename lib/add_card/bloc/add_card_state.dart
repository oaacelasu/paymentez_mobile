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
  final bool isNameValid;
  final bool isNumberValid;
  final bool isDateExpValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isNumberValid;

  AddCardState({
    @required this.cardBin,
    @required this.numberMaskFormatter,
    @required this.isNameValid,
    @required this.isNumberValid,
    @required this.isDateExpValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  AddCardState empty() {
    return copyWith(
      numberMaskFormatter:
          MaskTextInputFormatter(mask: numberDefaultMask, filter: filter),
      isNameValid: true,
      isNumberValid: true,
      isDateExpValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  AddCardState loading() {
    return copyWith(
      isNameValid: true,
      isNumberValid: true,
      isDateExpValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  AddCardState failure() {
    return copyWith(
      isNameValid: true,
      isNumberValid: true,
      isDateExpValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  AddCardState success() {
    return copyWith(
      isNameValid: true,
      isNumberValid: true,
      isDateExpValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  AddCardState updateName({
    bool isNameValid,
  }) {
    return copyWith(
      isNameValid: isNameValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  AddCardState updateNumber({
    String number,
    CardBinModel cardBin,
    bool isNumberValid,
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
      isNumberValid: isNumberValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  AddCardState updateDateExp({
    bool isDateExpValid,
  }) {
    return copyWith(
      isDateExpValid: isDateExpValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory AddCardState.fromJson(Map<String, dynamic> json) => AddCardState(
      cardBin: json['cardBin'],
      numberMaskFormatter: json['number_mask_formatter'],
      isNameValid: json['is_name_valid'],
      isNumberValid: json['is_number_valid'],
      isDateExpValid: json['is_date_exp_valid'],
      isSubmitting: json['is_submitting'],
      isSuccess: json['is_success'],
      isFailure: json['is_failure']);

  AddCardState copyWith({
    CardBinModel cardBin,
    MaskTextInputFormatter numberMaskFormatter,
    bool isNameValid,
    bool isNumberValid,
    bool isDateExpValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return AddCardState(
      cardBin: cardBin ?? this.cardBin,
      numberMaskFormatter: numberMaskFormatter ?? this.numberMaskFormatter,
      isNameValid: isNameValid ?? this.isNameValid,
      isNumberValid: isNumberValid ?? this.isNumberValid,
      isDateExpValid: isDateExpValid ?? this.isDateExpValid,
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
      isNameValid: $isNameValid,
      isNumberValid: $isNumberValid,
      isDateExpValid: $isDateExpValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }

  @override
  List<Object> get props => [
        cardBin,
        numberMaskFormatter,
        isNameValid,
        isNumberValid,
        isDateExpValid,
        isSubmitting,
        isSuccess,
        isFailure
      ];
}
