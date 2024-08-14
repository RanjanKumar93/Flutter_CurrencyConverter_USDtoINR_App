import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0.0;
  final TextEditingController textEditingController = TextEditingController();
  String errorText = '';

  void convert() {
    setState(() {
      try {
        final input = double.parse(textEditingController.text);
        result = input * 80;
        errorText = '';
      } catch (e) {
        errorText = 'Please enter a valid number';
        result = 0.0;
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        elevation: 5,
        title: const Text('Currency Converter USD to INR'),
        centerTitle: true,
        leading: const Icon(Icons.currency_exchange),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.deepPurple[700],
                ),
                child: Column(
                  children: [
                    Text(
                      'INR ${result.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (errorText.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorText,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter USD amount',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(Icons.attach_money, color: Colors.white),
                  filled: true,
                  fillColor: Colors.deepPurple[600],
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white54, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
