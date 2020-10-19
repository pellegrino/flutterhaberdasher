import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterhaberdasher/widgets/widgets.dart';
import 'package:flutterhaberdasher/blocs/blocs.dart';
import 'package:flutterhaberdasher/models/models.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final Size size = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (size != null) {
                BlocProvider.of<HaberdasherBloc>(context)
                    .add(MakeHatRequested(size: size));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<HaberdasherBloc, HaberdasherState>(
          builder: (context, state) {
            if (state is MakeHatInitial) {
              return Center(
                  child: Text('What is the desired size of your hat?'));
            }
            if (state is MakeHatLoadInProgress) {
              return Center(child: CircularProgressIndicator());
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
