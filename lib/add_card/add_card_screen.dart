import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';

import 'add_card_form.dart';
import 'bloc/add_card_bloc.dart';

class AddCardScreen extends StatelessWidget {
  final PaymentezRepository _paymentezRepository;

  AddCardScreen({Key key, @required PaymentezRepository paymentezRepository})
      : assert(paymentezRepository != null),
        _paymentezRepository = paymentezRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AddCard')),
      body: BlocProvider<AddCardBloc>(
        create: (context) =>
            AddCardBloc(paymentezRepository: _paymentezRepository),
        child: AddCardForm(paymentezRepository: _paymentezRepository),
      ),
    );
  }
}
