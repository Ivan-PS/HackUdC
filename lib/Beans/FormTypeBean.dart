class FormTypeBean {
  final int id;
  final String name;

  FormTypeBean({required this.id, required this.name});
  static FormTypeBean getByJson(Map<String, dynamic> json) {
    return FormTypeBean(id: json["form_type_id"], name: json["form_type_name"]);
  }

  static List<FormTypeBean> getByJsonList(List<dynamic> recivedList) {
    List<FormTypeBean> newList = [];
    recivedList.forEach((element) {
      newList.add(getByJson(element));
    });
    return newList;
  }

  static FormTypeBean empty() {
    return FormTypeBean(id: 0, name: "");
  }
}
