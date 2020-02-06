import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentez_mobile/add_card/add_card_form.dart';
import 'package:paymentez_mobile/add_card/bloc/bloc.dart';
import 'package:paymentez_mobile/channel/paymentez_channel.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';


class AddCardScreen extends StatelessWidget {
  final PaymentezRepository _paymentezRepository;

  AddCardScreen({Key key, @required PaymentezRepository paymentezRepository})
      : assert(paymentezRepository != null),
        _paymentezRepository = paymentezRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddCard'),
        leading: BackButton(
          onPressed: () => Paymentez.getInstance.pop(context),
        ),
      ),
      body: BlocProvider<AddCardBloc>(
        create: (context) =>
            AddCardBloc(paymentezRepository: _paymentezRepository),
        child: AddCardForm(paymentezRepository: _paymentezRepository),
      ),
    );
  }
}
