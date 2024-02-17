import 'package:dishashop/Activities/CreatNewFormPage.dart';
import 'package:dishashop/Utils/AccessNavigator.dart';
import 'package:dishashop/WidgetsCustom/Button/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CreateFieldsFlutter.dart';

class CreateFormPage extends StatefulWidget {
  const CreateFormPage({super.key});

  @override
  State<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                text: "Crear Una nueva enquesta",
                onPress: () {
                  AccessNavigator.accessTo(context, CreateNewFormPage());
                }),
          )
        ],
      )),
    );
  }
}
