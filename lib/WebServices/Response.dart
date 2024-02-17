class Response {
  int status = 0;
  dynamic data;

  static final String STATUS = "status";
  static final String DATA = "data";

  Response({required this.status, this.data});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
        status: json[STATUS], data: json[DATA] //UserBean.fromJson(json[DATA]),
        );
  }

  Map<String, dynamic> toJson() => {STATUS: status, DATA: data};

  bool isOKResponse() => status == 0;

  @override
  String toString() =>
      STATUS +
      " : " +
      status.toString() +
      " | " +
      DATA +
      " : " +
      data.toString();
}
