import 'package:dishashop/Beans/FormTypeBean.dart';
import 'package:dishashop/Beans/FormTypeInfo.dart';
import 'package:flutter/cupertino.dart';

import '../Utils/ResponseDecoder.dart';
import 'NetworkUtility.dart';
import 'package:http/http.dart' as http;

const HOST =
    "https://131b6ea8-87b5-4141-969d-29d7f4ad6b58.mock.pstmn.io/api/v1/";
const FORM_TYPES = "formTypes/";

class WebService {
  Future<List<FormTypeBean>> getFormTypes() async {
    String url =
        "https://8ad612dc-7ec9-4a5d-9291-f4e58620f5f4.mock.pstmn.io/api/v1/formTypes";
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
        ResponseDecoder().decodeResponse(response);
    return FormTypeBean.getByJsonList(responseDecoded.body as List);
  }

  Future<FormTypeInfoBean> getFormTypeById(int id) async {
    String url =
        "https://8ad612dc-7ec9-4a5d-9291-f4e58620f5f4.mock.pstmn.io/api/v1/formTypes/" +
            id.toString();
    http.Response response = await NetworkUtility().get(url, false);
    ResponseDecoder responseDecoded =
        ResponseDecoder().decodeResponse(response);
    return FormTypeInfoBean.getByJson(responseDecoded.body);
  }
}
