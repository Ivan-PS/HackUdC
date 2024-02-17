import 'package:dishashop/Adapters/FormFieldsListAdapter.dart';
import 'package:dishashop/Adapters/FormTypeListAdapter.dart';
import 'package:dishashop/Beans/FormTypeBean.dart';
import 'package:dishashop/WebServices/WebServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Adapters/FieldListAdapter.dart';
import '../Beans/FormTypeInfo.dart';

class FormPage extends StatefulWidget {
  final FormTypeBean formType;
  const FormPage({super.key, required this.formType});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool _isLoading = true;
  FormTypeInfoBean formTypeInfoBean = FormTypeInfoBean.empty();

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    getFormInfoTypeBean();
    // TODO: implement initState
    super.initState();
  }

  getFormInfoTypeBean() async {
    FormTypeInfoBean infoBean =
        await WebService().getFormTypeById(widget.formType.id);

    setState(() {
      formTypeInfoBean = infoBean;
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
            body: _isLoading
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 90),
                          child: Text(
                            widget.formType.name,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      FieldListAdapter(
                        items: formTypeInfoBean.fields,
                        groupNames: formTypeInfoBean.groups,
                      ),
                    ],
                  )),
      ),
    );
  }
}
