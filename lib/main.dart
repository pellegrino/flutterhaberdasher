import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhaberdasher/blocs/blocs.dart';
import 'package:flutterhaberdasher/models/models.dart';
import 'package:flutterhaberdasher/repositories/repositories.dart';

import 'package:flutterhaberdasher/simple_bloc_observer.dart';
import 'package:flutterhaberdasher/widgets/widgets.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final HaberdasherRepository haberdasherRepository = HaberdasherRepository(
    haberdasherClient: new ProtobufHaberdasher(
        "https://8mrhov2n0m.execute-api.us-west-2.amazonaws.com/"),
  );

  runApp(MyApp(haberdasherRepository: haberdasherRepository));
}

class MyApp extends StatelessWidget {
  final HaberdasherRepository haberdasherRepository;

  const MyApp({Key key, @required this.haberdasherRepository})
      : assert(haberdasherRepository != null),
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) =>
            HaberdasherBloc(haberdasherRepository: haberdasherRepository),
        child: MakeHatPage(),
      ),
    );
  }
}
