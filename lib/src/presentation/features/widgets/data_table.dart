import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final String title;
  const DataTableWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<dynamic> data = [
    {"Name": "John", "Age": 28, "Role": "Senior Supervisor", "checked": false},
    {"Name": "Jane", "Age": 32, "Role": "Administrator", "checked": false},
    {"Name": "Mary", "Age": 28, "Role": "Manager", "checked": false},
    {"Name": "Kumar", "Age": 32, "Role": "Administrator", "checked": false},
  ];
  List<dynamic> filteredData = [];

  final searchController = TextEditingController();

  @override
  void initState() {
    filteredData = data;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      filteredData = text.isEmpty
          ? data
          : data
              .where((item) =>
                  item['Name'].toLowerCase().contains(text.toLowerCase()) ||
                  item['Role'].toLowerCase().contains(text.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(),
          ),
          onChanged: _onSearchTextChanged,
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: DataTable(columns: const <DataColumn>[
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('Age'),
            numeric: true,
          ),
          DataColumn(
            label: Text('Role'),
          ),
        ], rows: [
          for (final item in filteredData)
            DataRow(
              cells: [
                DataCell(Text(item['Name'])),
                DataCell(Text(item['Age'].toString())),
                DataCell(Text(item['Role'])),
              ],
            )
        ]),
      ),
    ]);
  }
}
