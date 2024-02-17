import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String placeHoleder;
  final IconData icon;
  final bool obscure;
  const TextFieldCustom(
      {super.key,
      required this.placeHoleder,
      required this.icon,
      this.obscure = false});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        hintText: widget.placeHoleder,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
