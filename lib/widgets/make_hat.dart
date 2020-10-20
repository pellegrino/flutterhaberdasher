import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterhaberdasher/blocs/blocs.dart';
import 'package:flutterhaberdasher/models/models.dart';

import '../blocs/blocs.dart';

class MakeHatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a new hat"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocBuilder<HaberdasherBloc, HaberdasherState>(
          builder: (context, state) {
            if (state is MakeHatInitial) {
              return TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter the size of the hat in inches',
                ),
                onChanged: (text) => BlocProvider.of<HaberdasherBloc>(context)
                    .add(MakeHatRequested(size: Size(int.parse(text)))),
              );
            }

            if (state is MakeHatLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MakeHatLoadFailure) {
              return Center(
                child: Text('cara deu ruim'),
              );
            }

            if (state is MakeHatLoadSuccess) {
              final Hat hat = state.hat;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Text("Your hat is $hat.name"),
                    ),
                  ),
                  Center(
                    child: Text("Your hat is $hat.color"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: Text("Your hat is $hat.size"),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'enter the size of the hat in inches',
                    ),
                    onChanged: (text) =>
                        BlocProvider.of<HaberdasherBloc>(context)
                            .add(MakeHatRequested(size: Size(int.parse(text)))),
                  )
                ],
              );
            }
            if (state is MakeHatLoadFailure) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }
}
