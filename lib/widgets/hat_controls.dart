import 'package:flutter/material.dart';

class HatControls extends StatefulWidget {
  const HatControls({
    Key key,
  }) : super(key: key);
  @override
  _HatControlsState createState() => _HatControlsState();
}

class _HatControlsState extends State<HatControls> {
  final controller = TextEditingController();
  String inputStr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "What is the size of your hat? (in inches)"),
          onChanged: (value) => inputStr = value,
          onSubmitted: (_) => print("submit"),
        )
      ],
    );
  }
}
