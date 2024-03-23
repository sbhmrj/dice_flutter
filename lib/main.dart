

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () {
                  const snackBar =
                      SnackBar(content: Text('This is a snackbar.'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
        title: const Text('ROLL THE DICE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.teal[900],
      ),
      body: const DicePage(),
      // Assuming DicePage is your widget for displaying the dice
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceno = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                diceno = Random().nextInt(6) + 1;
                print('Hii Pressed.');
                
              });
            },
            
            child: Image.asset(
              'images/$diceno.jpg',
            ),
          ),
        ),
      ],
    ));
  }
}
