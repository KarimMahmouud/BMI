import 'package:flutter/material.dart';

class Reuslt extends StatelessWidget {
  const Reuslt(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  final double result;
  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Result', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          const SizedBox(height: 115),
          Text('Gender: ${isMale ? 'Male' : 'Femele'}',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 90),
          Text('Ruselt: ${result.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 80),
          Text(
              'Healthiness: ${result <= 18.4 ? 'Underweight' : result >= 18.5 && result <= 24.9 ? 'Normal' : result >= 25 && result <= 29.9 ? 'Overweight' : result >= 30 ? 'Obese' : 'Obese'}',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 90),
          Text('Age: $age',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center),
        ]),
      )),
    );
  }
}
