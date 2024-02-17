import 'package:dishashop/Adapters/FormTypeListAdapter.dart';
import 'package:dishashop/WebServices/WebServices.dart';
import 'package:flutter/cupertino.dart';

import '../Beans/FormTypeBean.dart';

class FormTypesPage extends StatefulWidget {
  const FormTypesPage({super.key});

  @override
  State<FormTypesPage> createState() => _FormTypesPageState();
}

class _FormTypesPageState extends State<FormTypesPage> {
  List<FormTypeBean> formTypes = [];

  @override
  void initState() {
    getFormTypes();
    // TODO: implement initState
    super.initState();
  }

  getFormTypes() async {
    List<FormTypeBean> forms = await WebService().getFormTypes();
    print(forms.toString());
    setState(() {
      formTypes = forms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: FormTypeListAdapter(items: formTypes));
  }
}
