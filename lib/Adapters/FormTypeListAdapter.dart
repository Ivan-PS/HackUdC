import 'package:dishashop/Activities/FormPage.dart';
import 'package:dishashop/Utils/AccessNavigator.dart';
import 'package:flutter/material.dart';

import '../Beans/FormTypeBean.dart';

class FormTypeListAdapter extends StatefulWidget {
  final List<FormTypeBean> items;
  const FormTypeListAdapter({super.key, required this.items});

  @override
  State<FormTypeListAdapter> createState() => _FormTypeListAdapterState();
}

class _FormTypeListAdapterState extends State<FormTypeListAdapter> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Card(
            // Wrap with a Card for better visual effect
            elevation: 5, // Adds shadow
            margin: EdgeInsets.all(2), // Spacing around the card
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text(
                widget.items[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                AccessNavigator.accessTo(
                    context, FormPage(formType: widget.items[index]));
              },
            ),
          ),
        );
      },
    );
  }
}
