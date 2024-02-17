import 'dart:convert';

import 'package:dishashop/Utils/AccessNavigator.dart';
import 'package:dishashop/WidgetsCustom/Button/CustomButton.dart';
import 'package:dishashop/WidgetsCustom/Forms/FormInputs/CheckBoxInput.dart';
import 'package:dishashop/WidgetsCustom/Forms/FormInputs/CustomFormNumber.dart';
import 'package:dishashop/WidgetsCustom/Forms/FormInputs/CustomFormSelector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Beans/FieldGroups.dart';
import '../Beans/FormFieldBean.dart';
import '../Beans/InputTextTypes.dart';
import '../WidgetsCustom/Forms/FormInputs/CustomDatePicker.dart';
import '../WidgetsCustom/Forms/FormInputs/CustomFormInputText.dart';

class FieldListAdapter extends StatefulWidget {
  final List<FormFieldBean> items;
  final List<FieldGroupBean> groupNames;
  const FieldListAdapter(
      {super.key, required this.items, required this.groupNames});

  @override
  State<FieldListAdapter> createState() => _FieldListAdapterState();
}

class _FieldListAdapterState extends State<FieldListAdapter> {
  List<Widget> listWidgets = [];
  List<FormFieldBean> items = [];
  Map<int, bool?> visibleStats = {};
  Map<int, Map<int, dynamic>> visibleConditions = {};
  List<Widget> toAdd = [];
  Map<int, dynamic> values = {};
  Map<int, int> associateKeys = {};
  List<bool> visibles = [];

  Map<int, dynamic> valuesPost = {};

  @override
  void initState() {
    instanceWidgets(true);
    // TODO: implement initState
    super.initState();
  }

  checkVisibility(int idChanged, dynamic valueIn) {
    visibleConditions.forEach((key, value) {
      value.forEach((key1, value1) {
        if (idChanged == key1) {
          if (value1 == valueIn) {
            setState(() {
              instanceWidgets(false);
              visibleStats[key] = true;
            });
          } else {
            setState(() {
              visibleStats[key] = false;
              instanceWidgets(false);
            });
          }
        }
      });
    });
  }

  changeValue(int id, dynamic value) {
    values[id] = value;
    checkVisibility(id, value);
    valuesPost[id] = value;
  }

  addVisibleStats(int idWitch, idcondition, dynamic condition) {
    if (!this.visibleConditions.containsKey(idWitch)) {
      this.visibleConditions[idWitch] = {idcondition: condition};
    }
    this.visibleConditions[idWitch]?[idcondition] = condition;
    visibleStats[idWitch] = false;
  }

  Map<String, List<FormFieldBean>> formatGroups(init) {
    Map<String, List<FormFieldBean>> grouped = {};
    for (FormFieldBean element in widget.items) {
      if (init) {
        visibleStats[element.id] = true;
      }

      if (!grouped.containsKey(element.group)) {
        grouped[element.group] = [];
      }
      grouped[element.group]!.add(element);
    }
    print("TEST" + grouped.toString());
    return grouped;
  }

  instanceWidgets(bool init) {
    setState(() {
      listWidgets = [];
    });
    Map<String, List<FormFieldBean>> grouped = formatGroups(init);

    grouped.forEach((key, value) {
      listWidgets.add(Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              changeGroupName(key),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ));
      listWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(
          height: 3,
        ),
      ));

      for (FormFieldBean element in value) {
        associateKeys[element.id] = visibles.length;

        if (init) {
          if (element.conditions.isNotEmpty) {
            addVisibleStats(element.id, element.conditions["field_id"],
                element.conditions["field_value"]);
          }
        }
        switch (element.type) {
          case InputType.TEXT:
            listWidgets.add((visibleStats[element.id] ?? false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormInputText(
                      formFieldBean: element,
                      onChange: (int id, String text) {
                        changeValue(id, value);
                      },
                    ),
                  )
                : Container()));
          case InputType.BOOLEAN:
            listWidgets.add((visibleStats[element.id] ?? false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckBoxInput(
                      formFieldBean: element,
                      onChange: (int id, bool value) {
                        changeValue(id, value);
                      },
                    ),
                  )
                : Container()));
          case InputType.DATE:
            listWidgets.add((visibleStats[element.id] ?? false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomDatePicker(
                      formFieldBean: element,
                      onChange: (int id, String value) {
                        changeValue(id, value);
                      },
                    ),
                  )
                : Container()));

          case InputType.NUMBER:
            listWidgets.add((visibleStats[element.id] ?? false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormNumber(
                      formFieldBean: element,
                      onChange: (int id, int number) {
                        changeValue(id, number);
                      },
                    ))
                : Container()));
          case InputType.SELECTOR:
            listWidgets.add((visibleStats[element.id] ?? false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormSelector(
                      formFieldSelectorBean: element,
                      onChange: (int id, String value) {
                        changeValue(id, value);
                      },
                    ))
                : Container()));
          case InputType.NONE:
            break;
        }
      }
    });
  }

  String changeGroupName(String group_name) {
    print(group_name);
    String name = "";
    widget.groupNames.forEach((element) {
      print(element);
      if (element.id == group_name) {
        name = element.name;
      }
    });
    return name;
  }

  validateFields() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Formulario enviado"),
    ));
    await Future.delayed(Duration(seconds: 1));

    AccessNavigator.goBack(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: Column(
                children: listWidgets +
                    [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            text: "Enviar",
                            onPress: () {
                              validateFields();
                            }),
                      )
                    ])));
  }
}
