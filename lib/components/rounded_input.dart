import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final Function(String) onSubmit;

  const RoundedInput({this.hintText, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //autofocus: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
      ),
      onSubmitted: onSubmit,
    );
  }
}


class RoundedInputOnChange extends StatelessWidget {
  final String hintText;
  final Function(String) onChange;

  const RoundedInputOnChange({this.hintText, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //autofocus: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: onChange,
    );
  }
}
