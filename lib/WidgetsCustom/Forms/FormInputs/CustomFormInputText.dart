import 'package:dishashop/Beans/FormFieldBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormInputText extends StatefulWidget {
  final FormFieldBean formFieldBean;
  final Function(int id, String text) onChange;
  const CustomFormInputText(
      {super.key, required this.formFieldBean, required this.onChange});

  @override
  State<CustomFormInputText> createState() => _CustomFormInputTextState();
}

class _CustomFormInputTextState extends State<CustomFormInputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        widget.onChange(widget.formFieldBean.id, value);
      },
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
