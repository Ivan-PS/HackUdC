import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Beans/FormFieldBean.dart';

class CheckBoxInput extends StatefulWidget {
  final FormFieldBean formFieldBean;
  final Function(int id, bool value) onChange;
  const CheckBoxInput(
      {super.key, required this.formFieldBean, required this.onChange});

  @override
  State<CheckBoxInput> createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.formFieldBean.name),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              widget.onChange(widget.formFieldBean.id, value);
              print(isSwitched);
            });
          },
          activeTrackColor: Colors.blue,
          activeColor: Colors.white,
        ),
      ],
    );
  }
}
