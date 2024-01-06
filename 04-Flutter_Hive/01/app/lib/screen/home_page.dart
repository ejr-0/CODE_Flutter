import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  bool isLoading = false;
  List<Map> items = [];

  final _dataBox = Hive.box('DataBox');

  ///[createData] function
  Future<void> createData(Map data) async {
    await _dataBox.add(data);
    getData();
  }

  ///[updateData] function
  Future<void> updateDate(Map data, int key) async {
    await _dataBox.put(key, data);
    getData();
  }

  ///[deleteData] function
  Future<void> deleteData(int key) async {
    await _dataBox.delete(key);
    getData();
  }

  ///[getData] function
  Future<void> getData() async {
    final data = _dataBox.keys.map((key) {
      final datum = _dataBox.get(key);
      return {
        'key': key,
        'first_name': datum['first_name'],
        'last_name': datum['last_name'],
      };
    }).toList();

    setState(() {
      items = data.reversed.toList();
      isLoading = true;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter & Hive'),
        backgroundColor: Colors.black12,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text('${item['first_name']} ${item['last_name']}'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            deleteData(item['key']);
                          },
                          child: const Text('Delete'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            TextEditingController firstName =
                                TextEditingController(text: item['first_name']);
                            TextEditingController lastName =
                                TextEditingController(text: item['last_name']);
                            _showDialog(
                              key: item['key'],
                              firstnameController: firstName,
                              lastnameController: lastName,
                              onPressed: () {
                                final isValid =
                                    _formKey.currentState!.validate();
                                if (isValid) {
                                  updateDate(
                                    {
                                      'first_name': firstName.text.trim(),
                                      'last_name': lastName.text.trim(),
                                    },
                                    item['key'],
                                  );
                                  Navigator.of(context).pop();
                                }
                                firstName.clear();
                                lastName.clear();
                              },
                            );
                          },
                          child: const Text('Edit'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(
            key: null,
            firstnameController: _firstName,
            lastnameController: _lastName,
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                createData({
                  'first_name': _firstName.text.trim(),
                  'last_name': _lastName.text.trim(),
                });
                Navigator.of(context).pop();
              }

              _firstName.clear();
              _lastName.clear();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDialog({
    required int? key,
    required TextEditingController firstnameController,
    required TextEditingController lastnameController,
    required void Function()? onPressed,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Add data'),
          contentPadding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: firstnameController,
                    decoration: const InputDecoration(
                      label: Text('First Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter first name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lastnameController,
                    decoration: const InputDecoration(
                      label: Text('Last Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter first name';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _firstName.clear();
                      _lastName.clear();
                    },
                    child: const Text('Cancel'),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: onPressed,
                    child: const Text('Done'),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
