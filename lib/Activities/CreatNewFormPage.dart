import 'package:dishashop/Utils/AccessNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CreateFieldsFlutter.dart';

class CreateNewFormPage extends StatefulWidget {
  const CreateNewFormPage({super.key});

  @override
  State<CreateNewFormPage> createState() => _CreateNewFormPageState();
}

class _CreateNewFormPageState extends State<CreateNewFormPage> {
  TextEditingController _textFieldController = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Empieza  a crear tu furmulario'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Pon aqui el nombre"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                AccessNavigator.accessTo(context, FieldListPage());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: const Text('Crea Tus propios formularios')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(Icons.plus_one),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
