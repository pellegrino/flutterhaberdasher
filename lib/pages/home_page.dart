import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhaberdasher/bloc/haberdasher_bloc.dart';
import 'package:flutterhaberdasher/model/model.dart';
import 'package:flutterhaberdasher/pages/pages.dart';
import 'package:flutterhaberdasher/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final Haberdasher haberdasherClient;

  const HomePage({
    Key key,
    @required this.haberdasherClient,
  })  : assert(haberdasherClient != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haberdasher'),
      ),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
    );
  }

  BlocProvider<HaberdasherBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => HaberdasherBloc(
        client: this.haberdasherClient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            BlocBuilder<HaberdasherBloc, HaberdasherState>(
                builder: (context, state) {
              if (state is HatInitial) {
                return MessageDisplay(
                  message: "What is the size of the hat (in inches)?",
                );
              } else if (state is HatLoaded) {
                return Text(
                  "Made hat ${state.hat}",
                  key: HaberdasherUIKeys.hatLoadedKey,
                );
              } else if (state is HatError) {
                return Text(
                  state.message,
                  key: HaberdasherUIKeys.hatErrorKey,
                );
              }

              return Text("Unexpected state");
            }),
            HatControls(),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
