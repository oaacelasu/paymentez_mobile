/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentez_mobile/add_card/add_card_screen.dart';
import 'package:paymentez_mobile/config/bloc.dart';
import 'package:paymentez_mobile/generated/l10n.dart';
import 'package:paymentez_mobile/repository/model/user.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';

//Root
var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Scaffold(
        body: Center(
          child: Text(S.of(context).app_name),
        ),
      );
    },
    type: HandlerType.route);

var addCardHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocBuilder<ConfigBloc, ConfigState>(
    builder: (context, state) {
      if (state.initiated != true) {
        return Center(child: Text('Loading...'));
      } else {
        String uid = params["uid"]?.first;
        String email = params["email"]?.first;

        return AddCardScreen(
            paymentezRepository: PaymentezRepository(
                configState: state,
                user: User(
                    id: uid,
                    email: email,
                    ipAddress: null,
                    fiscalNumber: null)));
      }
    },
  );
});
