import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhaberdasher/bloc/haberdasher_bloc.dart';
import 'package:flutterhaberdasher/widgets/widgets.dart';

class HomePage extends StatelessWidget {
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
      create: (_) => HaberdasherBloc(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            BlocBuilder<HaberdasherBloc, HaberdasherState>(
                builder: (context, state) {
              return MessageDisplay(
                message: "What is the size of the hat (in inches)?",
              );
            }),
            HatControls(),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
