import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:paymentez_mobile/generated/i18n.dart';
import 'package:paymentez_mobile/repository/model/card_model.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';
import 'package:paymentez_mobile/utils/validators.dart';

import 'add_card_button.dart';
import 'bloc/bloc.dart';

class AddCardForm extends StatefulWidget {
  final PaymentezRepository _paymentezRepository;

  AddCardForm({Key key, @required PaymentezRepository paymentezRepository})
      : assert(paymentezRepository != null),
        _paymentezRepository = paymentezRepository,
        super(key: key);

  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  final MaskTextInputFormatter _maskDateExpFormatter =
      MaskTextInputFormatter(mask: 'XX/XX', filter: AddCardState.filter);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _dateExpController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _fiscalNumberController = TextEditingController();
  TextEditingController _tuyaCodeController = TextEditingController();
  final _nameFocus = FocusNode();
  final _numberFocus = FocusNode();
  final _dateExpFocus = FocusNode();
  final _cvvFocus = FocusNode();
  final _fiscalNumberFocus = FocusNode();
  final _tuyaCodeFocus = FocusNode();
  AddCardBloc _addCardBloc;

  PaymentezRepository get _paymentezRepository => widget._paymentezRepository;

  bool get isPopulated => _addCardBloc.state.cardBin?.cvvLength != 0
      ? (_nameController.text.isNotEmpty &&
          _numberController.text.isNotEmpty &&
          _dateExpController.text.isNotEmpty &&
          _cvvController.text.isNotEmpty)
      : (_nameController.text.isNotEmpty &&
          _numberController.text.isNotEmpty &&
          _fiscalNumberController.text.isNotEmpty &&
          _tuyaCodeController.text.isNotEmpty);

  bool isAddCardButtonEnabled(AddCardState state) {
    return (isTuyaForm(state)?state.isTuyaFormValid:state.isFormValid) && isPopulated && !state.isSubmitting;
  }

  bool isNumberOk(AddCardState state) {
    return _numberController.value.text.isNotEmpty &&
        state.numberError.isEmpty &&
        _numberFocus.hasFocus;
  }

  bool isFiscalNumberOk(AddCardState state) {
    return _fiscalNumberController.value.text.isNotEmpty &&
        state.fiscalNumberError.isEmpty &&
        _fiscalNumberFocus.hasFocus;
  }

  bool isDateExpOk(AddCardState state) {
    return _dateExpController.value.text.isNotEmpty &&
        state.dateExpError.isEmpty &&
        _dateExpFocus.hasFocus;
  }

  bool isTuyaForm(AddCardState state) {
    return (state.cardBin?.cvvLength ?? 3) == 0;
  }

  @override
  void initState() {
    super.initState();
    _addCardBloc = BlocProvider.of<AddCardBloc>(context);
    _nameController.addListener(_onNameChanged);
    _numberController.addListener(_onNumberChanged);
    _dateExpController.addListener(_onDateExpChanged);
    _cvvController.addListener(_onCvvChanged);
    _fiscalNumberController.addListener(_onFiscalNumberChanged);
    _tuyaCodeController.addListener(_onTuyaCodeChanged);
  }

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));

    var messages = S.of(context);
    return BlocListener<AddCardBloc, AddCardState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Expanded(child: Text(state.message)), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Is loading ...')),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(state.message)),
                    CircularProgressIndicator(),
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
        }

        if (isNumberOk(state))
          FocusScope.of(context).requestFocus(
              isTuyaForm(state) ? _fiscalNumberFocus : _dateExpFocus);
        else if (isDateExpOk(state))
          FocusScope.of(context).requestFocus(_cvvFocus);
      },
      child: BlocBuilder<AddCardBloc, AddCardState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        icon: Icon(Icons.person, size: 25.0),
                        labelText: messages.add_card_name_label,
                        hintText: messages.add_card_name_hint),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    autofocus: true,
                    validator: (_) {
                      return state.nameError.isNotEmpty &&
                              _nameController.value.text.isNotEmpty
                          ? state.nameError
                          : null;
                    },
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(_numberFocus);
                    },
                  ),
                  TextFormField(
                    controller: _numberController,
                    focusNode: _numberFocus,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [state.numberMaskFormatter],
                    decoration: InputDecoration(
                        icon: cardIcon(state),
                        errorMaxLines: 3,
                        suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => setState(() {
                                  Future.delayed(Duration(milliseconds: 50))
                                      .then((_) {
                                    _numberController.clear();
                                  });
                                })),
                        hintText: messages.add_card_number_hint,
                        labelText: messages.add_card_number_label),
                    keyboardType: TextInputType.number,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return state.numberError.isNotEmpty &&
                              _numberController.value.text.isNotEmpty
                          ? state.numberError
                          : null;
                    },
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(_dateExpFocus);
                    },
                  ),
                  Visibility(
                    visible: !isTuyaForm(state),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: new TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: _dateExpFocus,
                              inputFormatters: [_maskDateExpFormatter],
                              autovalidate: true,
                              autocorrect: false,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  labelText:
                                      messages.add_card_expiration_date_label,
                                  hintText:
                                      messages.add_card_expiration_date_hint,
                                  errorMaxLines: 3),
                              controller: _dateExpController,
                              validator: (_) {
                                return state.dateExpError.isNotEmpty &&
                                        _dateExpController.value.text.isNotEmpty
                                    ? state.dateExpError
                                    : null;
                              },
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(_cvvFocus);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: new TextFormField(
                              textInputAction: TextInputAction.done,
                              focusNode: _cvvFocus,
                              maxLength: 4,
                              autovalidate: true,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.https),
                                  counterText: '',
                                  counterStyle: TextStyle(fontSize: 0),
                                  labelText: state.cardBin?.cvvLength == 4
                                      ? messages.add_card_cvc_amex_label
                                      : messages.add_card_cvc_label,
                                  hintText: state.cardBin?.cvvLength == 4
                                      ? messages.add_card_cvc_amex_hint
                                      : messages.add_card_cvc_hint,
                                  errorMaxLines: 3),
                              controller: _cvvController,
                              validator: (_) {
                                return state.cvvError.isNotEmpty &&
                                        _cvvController.value.text.isNotEmpty
                                    ? state.cvvError
                                    : null;
                              },
                              onFieldSubmitted: (v) {
                                if (isAddCardButtonEnabled(state))
                                  _onFormSubmitted();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    replacement: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _fiscalNumberController,
                          focusNode: _fiscalNumberFocus,
                          textInputAction: TextInputAction.next,
                          maxLength: 15,
                          decoration: InputDecoration(
                              icon: Icon(FontAwesomeIcons.idCard, size: 25.0),
                              counterText: '',
                              counterStyle: TextStyle(fontSize: 0),
                              errorMaxLines: 3,
                              labelText: messages.add_card_fiscal_number_label),
                          keyboardType: TextInputType.number,
                          autovalidate: true,
                          autocorrect: false,
                          validator: (_) {
                            return state.fiscalNumberError.isNotEmpty &&
                                    _fiscalNumberController
                                        .value.text.isNotEmpty
                                ? state.fiscalNumberError
                                : null;
                          },
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).requestFocus(_tuyaCodeFocus);
                          },
                        ),
                        TextFormField(
                          controller: _tuyaCodeController,
                          focusNode: _tuyaCodeFocus,
                          textInputAction: TextInputAction.done,
                          maxLength: 8,
                          decoration: InputDecoration(
                              icon: Icon(Icons.https, size: 25.0),
                              counterText: '',
                              counterStyle: TextStyle(fontSize: 0),
                              errorMaxLines: 3,
                              labelText: messages.add_card_tuya_code_label),
                          keyboardType: TextInputType.number,
                          autovalidate: true,
                          autocorrect: false,
                          validator: (_) {
                            return state.tuyaCodeError.isNotEmpty &&
                                    _tuyaCodeController.value.text.isNotEmpty
                                ? state.tuyaCodeError
                                : null;
                          },
                          onFieldSubmitted: (v) {
                            if (isAddCardButtonEnabled(state))
                              _onFormSubmitted();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        AddCardButton(
                          onPressed: isAddCardButtonEnabled(state)
                              ? _onFormSubmitted
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox cardIcon(AddCardState state) {
    return SizedBox(
      width: 25.0,
      child: Visibility(
        visible: (state.cardBin?.urlLogo ?? '').isEmpty,
        child: Image.asset('assets/images/card_generic.png'),
        replacement: SvgPicture.network(
          state.cardBin?.urlLogo ?? '',
          semanticsLabel: 'card_bin_image',
          placeholderBuilder: (BuildContext context) =>
              FadeInImage.assetNetwork(
                  placeholder: 'assets/images/card_generic.png',
                  image: state.cardBin?.urlLogoPng?.replaceAll('svg', 'png') ??
                      ''),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _dateExpController.dispose();
    _cvvController.dispose();
    _fiscalNumberController.dispose();
    _tuyaCodeController.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    _addCardBloc.add(
      NameChanged(context, name: _nameController.value.text.trim()),
    );
  }

  void _onNumberChanged() {
    _addCardBloc.add(NumberChanged(context,
        number: _numberController.value.text.replaceAll(' ', '')));
    if (_cvvController.value.text.isNotEmpty) _onCvvChanged();
  }

  void _onDateExpChanged() {
    setState(() {
      _dateExpFormatter();
      _addCardBloc
          .add(DateExpChanged(context, dateExp: _dateExpController.value.text.trim()));
    });
  }

  void _onCvvChanged() {
    _addCardBloc.add(CvvChanged(context, cvv: _cvvController.value.text.trim()));
  }

  void _onFiscalNumberChanged() {
    _addCardBloc.add(FiscalNumberChanged(context,
        fiscalNumber: _fiscalNumberController.value.text.trim()));
  }

  void _onTuyaCodeChanged() {
    _addCardBloc.add(
        TuyaCodeChanged(context, tuyaCode: _tuyaCodeController.value.text.trim()));
  }

  void _dateExpFormatter() {
    var text = _dateExpController.value.text;

    switch (text.length) {
      case 0:
        _dateExpController.value = _maskDateExpFormatter.updateMask('XX/XX');
        break;
      case 1:
        if (int.parse(text) > 1)
          _dateExpController.value = _maskDateExpFormatter.updateMask('0X/XX');
        break;
      case 2:
        if (int.parse(text) > 12 || int.parse(text) == 0)
          _dateExpController.value = _maskDateExpFormatter.updateMask('0X/XX');
        break;
    }
  }

  void _onFormSubmitted() {
    FocusScope.of(context).requestFocus(FocusNode());
    var card = CardModel(
        bin: null,
        status: null,
        token: null,
        message: null,
        expiryYear: Validators.convertYearTo4Digits(int.parse(_dateExpController
                .value.text
                .split(RegExp(r'(\/)'))
                .elementAt(1)))
            .toString(),
        expiryMonth:
            _dateExpController.value.text.split(RegExp(r'(\/)')).elementAt(0),
        transactionReference: null,
        type: _addCardBloc.state.cardBin?.cardType,
        number: _numberController.value.text.replaceAll(' ', ''),
        origin: null,
        holderName: _nameController.value.text,
        cvc: _cvvController.value.text);
    _addCardBloc.add(
      Submitted(
        context,
        card: card,
      ),
    );
  }
}
