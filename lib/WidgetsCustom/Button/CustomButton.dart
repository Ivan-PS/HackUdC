import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function() onPress;
  const CustomButton({super.key, required this.text, required this.onPress});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10), // Replace 10 with desired radius value
          ),
        ),
        onPressed: widget.onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
