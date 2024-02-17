import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Beans/FormFieldBean.dart';

class CustomDatePicker extends StatefulWidget {
  final FormFieldBean formFieldBean;
  final Function(int id, String value) onChange;
  const CustomDatePicker(
      {super.key, required this.formFieldBean, required this.onChange});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) {
        widget.onChange(widget.formFieldBean.id, value);
      },
      readOnly: true, // when true user cannot edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));
        textEditingController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate!);
      },

      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.date_range),
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
