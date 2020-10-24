import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhaberdasher/logging_bloc_observer.dart';
import 'package:flutterhaberdasher/model/model.dart';
import 'package:flutterhaberdasher/pages/home_page.dart';

void main() {
  BlocObserver loggingBlocObserver = LoggingBlocObserver();
  Bloc.observer = loggingBlocObserver;

  Haberdasher haberdasherClient = ProtobufHaberdasher(
    "https://8mrhov2n0m.execute-api.us-west-2.amazonaws.com",
  );

  runApp(MyApp(
    haberdasherClient: haberdasherClient,
  ));
}

class MyApp extends StatelessWidget {
  final Haberdasher haberdasherClient;

  const MyApp({
    Key key,
    @required this.haberdasherClient,
  })  : assert(haberdasherClient != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(
        haberdasherClient: haberdasherClient,
      ),
    );
  }
}
