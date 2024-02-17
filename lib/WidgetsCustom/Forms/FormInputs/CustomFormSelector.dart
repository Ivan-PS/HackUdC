import 'package:dishashop/Beans/FormFieldBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormSelector extends StatefulWidget {
  final FormFieldBean formFieldSelectorBean;
  final Function(int id, String value) onChange;
  const CustomFormSelector(
      {super.key, required this.formFieldSelectorBean, required this.onChange});

  @override
  State<CustomFormSelector> createState() => _CustomFormSelectorState();
}

class _CustomFormSelectorState extends State<CustomFormSelector> {
  String dropdownValue = "";
  @override
  void initState() {
    setState(() {
      dropdownValue = widget.formFieldSelectorBean.opts.first;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
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
      borderRadius: BorderRadius.circular(32),
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? value) {
        widget.onChange(widget.formFieldSelectorBean.id, value!);
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: [
            DropdownMenuItem<String>(
              value: "---",
              child: Text("---"),
            )
          ] +
          widget.formFieldSelectorBean.opts
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
    );
  }
}
