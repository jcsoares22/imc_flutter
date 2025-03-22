import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String result = "";

  void calculateIMC() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double imc = weight / (height * height);
      String category;

      if (imc < 16) {
        category = "Magreza Grave";
      } else if (imc < 17) {
        category = "Magreza Moderada";
      } else if (imc < 18.5) {
        category = "Magreza Leve";
      } else if (imc < 25) {
        category = "Saudável";
      } else if (imc < 30) {
        category = "Obesidade Grau 1";
      } else if (imc < 35) {
        category = "Obesidade Grau 2";
      } else {
        category = "Obesidade Grau 3";
      }

      setState(() {
        result = "IMC: ${imc.toStringAsFixed(2)}\nCategoria: $category";
      });
    } else {
      setState(() {
        result = "Preencha os campos corretamente.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de IMC")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Peso (kg)"),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Altura (m)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateIMC,
              child: const Text("Calcular IMC"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
