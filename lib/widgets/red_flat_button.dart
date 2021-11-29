import 'package:flutter/material.dart';

class RedFlatBtn extends StatelessWidget {
  // final Function handler;
  // RedFlatBtn(this.handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.red,
        child: Text(
          'NO',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
