import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Beans/FormFieldBean.dart';

class CustomFormNumber extends StatefulWidget {
  final FormFieldBean formFieldBean;
  final Function(int id, int number) onChange;
  const CustomFormNumber(
      {super.key, required this.formFieldBean, required this.onChange});

  @override
  State<CustomFormNumber> createState() => _CustomFormNumberState();
}

class _CustomFormNumberState extends State<CustomFormNumber> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        widget.onChange(widget.formFieldBean.id, int.parse(value));
      },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      keyboardType: TextInputType.number,
      obscureText: false,
      decoration: InputDecoration(
        hintText: widget.formFieldBean.name,
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
