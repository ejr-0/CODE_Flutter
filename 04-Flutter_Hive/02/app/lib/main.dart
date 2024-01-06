import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('SampleBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _sampleBox = Hive.box('SampleBox');

  ///[createData] function
  Future<void> createData(Map data) async {
    await _sampleBox.add(data);
    // ignore: avoid_print
    print('${_sampleBox.keys}, ${_sampleBox.values.indexed}');
  }

  ///[updateData] function
  Future<void> updateData(Map data, int key) async {
    await _sampleBox.put(key, data);
    // ignore: avoid_print
    print('${_sampleBox.keys}, ${_sampleBox.values.indexed}');
  }

  ///[deleteData] function
  Future<void> deleteData(int key) async {
    await _sampleBox.delete(key);
    // ignore: avoid_print
    print('${_sampleBox.keys}, ${_sampleBox.values.indexed}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive'),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: OutlinedButton(
                  onPressed: () {
                    createData({
                      'product': 'apple',
                      'quantity': 23,
                    });
                  },
                  child: const Text('Create Data'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: OutlinedButton(
                  onPressed: () {
                    updateData(
                      {
                        'product': 'apple',
                        'quantity': 100,
                      },
                      1,
                    );
                  },
                  child: const Text('Update Data'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: OutlinedButton(
                  onPressed: () {
                    deleteData(14);
                  },
                  child: const Text('Delete Data'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: OutlinedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print(_sampleBox.keys);
                    // ignore: avoid_print
                    print(_sampleBox.values);
                  },
                  child: const Text('Print Data'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
