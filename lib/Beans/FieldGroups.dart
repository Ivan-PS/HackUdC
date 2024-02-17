class FieldGroupBean {
  final String id;
  final String name;

  FieldGroupBean({required this.id, required this.name});
  static FieldGroupBean getByJson(Map<String, dynamic> json) {
    return FieldGroupBean(id: json["group_id"], name: json["group_name"]);
  }

  static List<FieldGroupBean> getByJsonList(List<dynamic> recivedList) {
    List<FieldGroupBean> newList = [];
    recivedList.forEach((element) {
      newList.add(getByJson(element));
    });
    return newList;
  }

  static FieldGroupBean empty() {
    return FieldGroupBean(id: "", name: "");
  }
}
