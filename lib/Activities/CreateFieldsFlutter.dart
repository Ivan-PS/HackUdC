import 'package:flutter/material.dart';

class FieldListPage extends StatefulWidget {
  @override
  _FieldListPageState createState() => _FieldListPageState();
}

class _FieldListPageState extends State<FieldListPage> {
  List<FieldConfig> fields = [];

  void _addField() {
    setState(() {
      fields.add(FieldConfig());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addField,
            child: Text('Añadir un nuevo campo'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                return FieldConfigItem(
                  key: ObjectKey(fields[index]),
                  fieldConfig: fields[index],
                  onDelete: () {
                    setState(() {
                      fields.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FieldConfig {
  String name = '';
  String description = '';
  String type = 'Text'; // Default type
  String restriction = '';
}

class FieldConfigItem extends StatelessWidget {
  final FieldConfig fieldConfig;
  final VoidCallback onDelete;

  FieldConfigItem({Key? key, required this.fieldConfig, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => fieldConfig.name = value,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                onChanged: (value) => fieldConfig.description = value,
                decoration: InputDecoration(labelText: 'Descripcion'),
              ),
              DropdownButton<String>(
                value: fieldConfig.type,
                onChanged: (value) {
                  fieldConfig.type = value!;
                },
                items: <String>['Text', 'Number', 'Date']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                onChanged: (value) => fieldConfig.restriction = value,
                decoration: InputDecoration(labelText: 'Comentarios'),
              ),
              ElevatedButton(
                onPressed: onDelete,
                child: Text('Eliminar'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
