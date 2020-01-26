import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';

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
  final _nameFocus = FocusNode();
  final _numberFocus = FocusNode();
  final _dateExpFocus = FocusNode();
  final _cvvFocus = FocusNode();
  AddCardBloc _addCardBloc;

  PaymentezRepository get _paymentezRepository => widget._paymentezRepository;

  bool get isPopulated =>
      _nameController.text.isNotEmpty &&
      _numberController.text.isNotEmpty &&
      _dateExpController.text.isNotEmpty &&
      _cvvController.text.isNotEmpty;

  bool isAddCardButtonEnabled(AddCardState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  bool isNumberOk(AddCardState state) {
    return _numberController.value.text.isNotEmpty &&
        state.isNumberValid &&
        _numberFocus.hasFocus;
  }

  bool isDateExpOk(AddCardState state) {
    return _dateExpController.value.text.isNotEmpty &&
        state.isDateExpValid &&
        _dateExpFocus.hasFocus;
  }

  @override
  void initState() {
    super.initState();
    _addCardBloc = BlocProvider.of<AddCardBloc>(context);
    _nameController.addListener(_onNameChanged);
    _numberController.addListener(_onNumberChanged);
    _dateExpController.addListener(_onDateExpChanged);
    _cvvController.addListener(_onCvvChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCardBloc, AddCardState>(
      listener: (context, state) {
        if (state.isSuccess) {
          print('success');
        }
        if (isNumberOk(state))
          FocusScope.of(context).requestFocus(_dateExpFocus);
        else if (isDateExpOk(state))
          FocusScope.of(context).requestFocus(_cvvFocus);
      },
      child: BlocBuilder<AddCardBloc, AddCardState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, size: 30.0),
                      labelText: 'Name',
                    ),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    autofocus: true,
                    validator: (_) {
                      return !state.isNameValid &&
                              _nameController.value.text.isNotEmpty
                          ? 'Invalid Name'
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
                      suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => setState(() {
                                Future.delayed(Duration(milliseconds: 50))
                                    .then((_) {
                                  _numberController.clear();
                                });
                              })),
                      labelText: 'Card Number',
                    ),
                    keyboardType: TextInputType.number,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isNumberValid &&
                              _numberController.value.text.isNotEmpty
                          ? 'Invalid Number'
                          : null;
                    },
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(_dateExpFocus);
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: _dateExpFocus,
                            inputFormatters: [_maskDateExpFormatter],
                            autovalidate: true,
                            autocorrect: false,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: 'DateTime',
                            ),
                            controller: _dateExpController,
                            validator: (_) {
                              return !state.isDateExpValid &&
                                      _dateExpController.value.text.isNotEmpty
                                  ? 'Invalid Date'
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
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            textInputAction: TextInputAction.done,
                            focusNode: _cvvFocus,
                            maxLength: 4,
                            autovalidate: true,
                            autocorrect: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(Icons.https),
                              labelText: 'Cvv',
                            ),
                            controller: _cvvController,
                            validator: (_) {
                              return !state.isCvvValid &&
                                      _cvvController.value.text.isNotEmpty
                                  ? 'Invalid Cvv'
                                  : null;
                            },
                            onFieldSubmitted: (v) {
                              _onFormSubmitted();
                            },
                          ),
                        ),
                      ),
                    ],
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
      width: 30.0,
      child: Visibility(
        visible: state.cardBin?.urlLogo == null,
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
    _numberController.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    _addCardBloc.add(
      NameChanged(name: _nameController.value.text),
    );
  }

  void _onNumberChanged() {
    _addCardBloc.add(NumberChanged(
        number: _numberController.value.text.replaceAll(' ', '')));
  }

  void _onDateExpChanged() {
    setState(() {
      _dateExpFormatter();
      _addCardBloc.add(DateExpChanged(dateExp: _dateExpController.value.text));
    });
  }

  void _onCvvChanged() {
    _addCardBloc.add(CvvChanged(cvv: _cvvController.value.text));
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
    print('_onFormSubmitted');
//    _AddCardBloc.add(
//      AddCardWithCredentialsPressed(
//        email: _emailController.text,
//        password: _passwordController.text,
//      ),
//    );
  }
}
