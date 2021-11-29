import 'package:flutter/material.dart';

class GreenFlatBtn extends StatelessWidget {
  final Function handler;
  GreenFlatBtn(this.handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        onPressed: () => handler('Yes'),
        color: Colors.green,
        child: Text(
          'YES',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
