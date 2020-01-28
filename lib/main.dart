import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paymentez_mobile/config/bloc.dart';
import 'package:paymentez_mobile/repository/paymentez_repository.dart';
import 'package:paymentez_mobile/simple_bloc_delegate.dart';

import 'add_card/add_card_screen.dart';
import 'channel/paymentez_channel.dart';
import 'generated/i18n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      create: (context) => ConfigBloc()
        ..add(SetEnvironment(
            testMode: '',
            paymentezClientAppCode: '',
            paymentezClientAppKey: '')),
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with AfterLayoutMixin<App> {
  List<LocalizationsDelegate> delegates = List<LocalizationsDelegate>();

  @override
  void initState() {
    super.initState();

    delegates = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      S.delegate
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: delegates,
      supportedLocales: [
        const Locale('es', ''),
        const Locale('en', ''),
        const Locale('pt', ''),
      ],
      home: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return AddCardScreen(
              paymentezRepository: PaymentezRepository(configState: state));
        },
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    print('afterFirstLayout called');
    Paymentez.getInstance.init(context);
  }
}
