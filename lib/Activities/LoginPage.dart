import 'package:dishashop/Activities/MainAdminPage.dart';
import 'package:dishashop/WidgetsCustom/Button/CustomButton.dart';
import 'package:dishashop/WidgetsCustom/Inputs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/AccessNavigator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustom(placeHoleder: "Usuario", icon: Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustom(
              placeHoleder: "Contraseña",
              icon: Icons.key,
              obscure: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, right: 16, left: 16),
            child: CustomButton(
                text: "Entrar",
                onPress: () {
                  AccessNavigator.accessTo(context, MainAdminPage());
                }),
          )
        ],
      ),
    );
  }
}
