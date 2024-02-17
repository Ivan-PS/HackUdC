import 'package:dishashop/Beans/InputTextTypes.dart';

class FormFieldBean {
  final int id;
  final String name;
  final InputType type;
  final int order;
  final bool isRequired;
  final String description;
  final bool isReadOnly;
  final String group;
  final String format;
  final List<String> opts;
  final Map<String, dynamic> conditions;
  FormFieldBean(
      {required this.id,
      required this.name,
      required this.type,
      required this.order,
      required this.isRequired,
      required this.description,
      required this.isReadOnly,
      required this.group,
      required this.format,
      required this.opts,
      required this.conditions});
  static FormFieldBean getByJson(Map<String, dynamic> jsonData) {
    if (jsonData["field_type"] == "text") {
      return FormFieldBean(
          id: jsonData["field_id"],
          name: jsonData["field_name"],
          type: InputType.TEXT,
          order: jsonData["field_order"],
          isRequired: jsonData["field_required"],
          description: jsonData["field_description"],
          isReadOnly: false,
          group: jsonData["field_group"] == null ? "" : jsonData["field_group"],
          format: "",
          opts: [],
          conditions: jsonData["field_dependent_on"] == null
              ? {}
              : {
                  "field_id": jsonData["field_dependent_on"]["field_id"],
                  "field_value": jsonData["field_dependent_on"]["field_value"]
                });
    } else if (jsonData["field_type"] == "date") {
      return FormFieldBean(
          id: jsonData["field_id"],
          name: jsonData["field_name"],
          type: InputType.DATE,
          order: jsonData["field_order"],
          isRequired: jsonData["field_required"],
          description: jsonData["field_description"],
          isReadOnly: false,
          group: jsonData["field_group"],
          format: '',
          opts: [],
          conditions: jsonData["field_dependent_on"] == null
              ? {}
              : {
                  "field_id": jsonData["field_dependent_on"]["field_id"],
                  "field_value": jsonData["field_dependent_on"]["field_value"]
                });
    } else if (jsonData["field_type"] == "select") {
      return FormFieldBean(
          id: jsonData["field_id"],
          name: jsonData["field_name"],
          type: InputType.SELECTOR,
          order: jsonData["field_order"],
          isRequired: jsonData["field_required"],
          description: jsonData["field_description"],
          isReadOnly: false,
          group: jsonData["field_group"],
          opts: (jsonData["field_validations"]["options"] as List)
              .map((e) => e as String)
              .toList(), // jsonData["field_validations"]["options"],
          format: '',
          conditions: jsonData["field_dependent_on"] == null
              ? {}
              : {
                  "field_id": jsonData["field_dependent_on"]["field_id"],
                  "field_value": jsonData["field_dependent_on"]["field_value"]
                });
    } else if (jsonData["field_type"] == "boolean") {
      return FormFieldBean(
          id: jsonData["field_id"],
          name: jsonData["field_name"],
          type: InputType.BOOLEAN,
          order: jsonData["field_order"],
          isRequired: jsonData["field_required"],
          description: jsonData["field_description"],
          isReadOnly: false,
          group: jsonData["field_group"],
          opts: [], // jsonData["field_validations"]["options"],
          format: '',
          conditions: jsonData["field_dependent_on"] == null
              ? {}
              : {
                  "field_id": jsonData["field_dependent_on"]["field_id"],
                  "field_value": jsonData["field_dependent_on"]["field_value"]
                });
    } else if (jsonData["field_type"] == "number") {
      return FormFieldBean(
          id: jsonData["field_id"],
          name: jsonData["field_name"],
          type: InputType.NUMBER,
          order: jsonData["field_order"],
          isRequired: jsonData["field_required"],
          description: jsonData["field_description"],
          isReadOnly: false,
          group: jsonData["field_group"],
          opts: [], // jsonData["field_validations"]["options"],
          format: '',
          conditions: jsonData["field_dependent_on"] == null
              ? {}
              : {
                  "field_id": jsonData["field_dependent_on"]["field_id"],
                  "field_value": jsonData["field_dependent_on"]["field_value"]
                });
    } else {
      return empty();
    }
  }

  static List<FormFieldBean> getByjsonList(List<dynamic> recivedList) {
    List<FormFieldBean> newList = [];
    recivedList.forEach((element) {
      newList.add(getByJson(element));
    });
    return newList;
  }

  static FormFieldBean empty() {
    return FormFieldBean(
        id: 0,
        name: "",
        type: InputType.NONE,
        order: 0,
        isRequired: false,
        description: "",
        isReadOnly: false,
        group: "",
        format: '',
        opts: [],
        conditions: {});
  }
}
