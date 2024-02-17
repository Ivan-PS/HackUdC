import 'package:flutter/cupertino.dart';

import 'FieldGroups.dart';
import 'FormFieldBean.dart';

class FormTypeInfoBean {
  final int id;
  final String name;
  final List<FormFieldBean> fields;
  final List<FieldGroupBean> groups;

  FormTypeInfoBean(
      {required this.id,
      required this.name,
      required this.fields,
      required this.groups});
  static FormTypeInfoBean getByJson(Map<String, dynamic> json) {
    return FormTypeInfoBean(
        id: json["form_type_id"],
        name: json["form_type_name"],
        fields: FormFieldBean.getByjsonList(
          json["form_fields"],
        ),
        groups: []);
  }

  static List<FormTypeInfoBean> getByJsonList(List<dynamic> recivedList) {
    List<FormTypeInfoBean> newList = [];
    recivedList.forEach((element) {
      newList.add(getByJson(element));
    });
    return newList;
  }

  static FormTypeInfoBean empty() {
    return FormTypeInfoBean(id: 0, name: "", fields: [], groups: []);
  }
}
