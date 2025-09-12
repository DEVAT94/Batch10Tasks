import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Währungsrechner',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  Map<String, double> _rates = {};
  String _from = 'EUR';
  String _to = 'USD';
  double _input = 1.0;
  String _result = '';
  bool _isLoading = true;

  final String _apiUrl =
      'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_Ya0ApKUrH2qRDszw8xfO7yRMcHo86kZDoeQk5FLC&currencies=EUR,USD,JPY,RON,RUB&base_currency=EUR';

  @override
  void initState() {
    super.initState();
    testInternet();
    _loadRates();
  }

  Future<void> testInternet() async {
    try {
      final res = await http.get(Uri.parse('https://google.com'));
      if (kDebugMode) {
        print('Google Status: ${res.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Kein Internet: $e');
      }
    }
  }

  Future<void> _loadRates() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (kDebugMode) {
        print('API-Status: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Antwort: ${response.body}');
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final Map<String, dynamic> data = json['data'];

        setState(() {
          _rates = data.map((key, value) => MapEntry(key, (value as num).toDouble()));
          _from = _rates.keys.first;
          _to = _rates.keys.elementAt(1);
          _isLoading = false;
        });
      } else {
        setState(() {
          _result = 'Fehler beim Laden (${response.statusCode})';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Fehler beim Abrufen der Daten.';
        _isLoading = false;
      });
      if (kDebugMode) {
        print('Fehler: $e');
      }
    }
  }

  void _convert() {
    if (_rates.isEmpty) return;

    final fromRate = _rates[_from]!;
    final toRate = _rates[_to]!;
    final converted = _input / fromRate * toRate;

    setState(() {
      _result = '${_input.toStringAsFixed(2)} $_from = ${converted.toStringAsFixed(2)} $_to';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Währungsrechner')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Betrag in $_from'),
                    onChanged: (value) {
                      setState(() {
                        _input = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<String>(
                        value: _from,
                        items: _rates.keys
                            .map((code) => DropdownMenuItem(
                                  value: code,
                                  child: Text(code),
                                ))
                            .toList(),
                        onChanged: (value) => setState(() => _from = value!),
                      ),
                      Icon(Icons.arrow_forward),
                      DropdownButton<String>(
                        value: _to,
                        items: _rates.keys
                            .map((code) => DropdownMenuItem(
                                  value: code,
                                  child: Text(code),
                                ))
                            .toList(),
                        onChanged: (value) => setState(() => _to = value!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _convert,
                    child: Text('Umrechnen'),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
