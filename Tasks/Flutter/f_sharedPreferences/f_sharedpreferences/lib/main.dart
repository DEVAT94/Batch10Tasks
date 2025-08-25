import 'package:flutter/material.dart';
import 'package:f_sharedpreferences/prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializePersistence();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  final TextEditingController controller = TextEditingController();
  String? name;
  bool isDarkMode = false;

  Future<void> _loadSavedName() async {
    final saved = loadName();
    setState(() {
      name = saved;
    });
  }

  Future<void> _saveName() async {
    final newName = controller.text.trim();
    await saveName(newName);
    setState(() {
      name = newName;
    });
  }

  Future<void> _loadDarkMode() async {
    final savedDark = await loadDarkMode();
    setState(() {
      isDarkMode = savedDark;
    });
  }

  Future<void> _saveDarkMode(bool value) async {
    await setDarkMode(value);
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSavedName();
    _loadDarkMode();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Namesaver'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Gib deinen Namen ein:'),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Name...'),
            ),
            Text(name ?? ''),
            ElevatedButton(onPressed: _saveName, child: const Text('Save')),
            Switch(value: isDarkMode,
            activeColor: Colors.greenAccent,
            
            onChanged: (bool value) {
              _saveDarkMode(value);
            },),
            Text('DarkMode on: ${isDarkMode.toString()}')
          ],
        ),
      ),
    );
  }
}
