import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55, age = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Body Mass index',
            style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  box1(context, 'male'),
                  const SizedBox(width: 15),
                  box1(context, 'femele'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  box3(context),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  box2(context, 'Weight'),
                  const SizedBox(width: 15),
                  box2(context, 'age'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.teal),
              // color: Colors.teal,
              width: 295,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                  onPressed: () {
                    var res = weight / pow(heightVal / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Reuslt(result: res, isMale: isMale, age: age)));
                  },
                  child: const Text('Calculate',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ]),
      ),
    );
  }

  Expanded box1(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() => isMale = type == 'male' ? true : false);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (type == 'male' && isMale) || (type == 'femele' && !isMale)
                ? Colors.teal
                : Colors.blueGrey),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(type == 'male' ? Icons.male : Icons.female),
          const SizedBox(width: 15),
          Text(type == 'male' ? 'Male' : 'Femele',
              style: Theme.of(context).textTheme.bodySmall)
        ]),
      ),
    ));
  }

  Expanded box2(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(type == 'age' ? 'Age' : 'Weight',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 10),
        Text(type == 'age' ? '$age' : '$weight',
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.teal,
                heroTag: type == 'age' ? 'age++' : 'weight++',
                onPressed: () =>
                    setState(() => type == 'age' ? age++ : weight++),
                mini: true,
                child: const Icon(Icons.add, color: Colors.white)),
            const SizedBox(width: 10),
            FloatingActionButton(
                backgroundColor: Colors.teal,
                heroTag: type == 'age' ? 'age--' : 'weight--',
                onPressed: () =>
                    setState(() => type == 'age' ? age-- : weight--),
                mini: true,
                child: const Icon(Icons.remove, color: Colors.white))
          ],
        )
      ]),
    ));
  }

  Expanded box3(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Height', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(heightVal.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyLarge),
            const Text(
              'CM',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Slider(
            min: 0,
            max: 250,
            value: heightVal,
            onChanged: (double newVal) {
              setState(() => heightVal = newVal);
            },
            activeColor: Colors.teal)
      ]),
    ));
  }
}
