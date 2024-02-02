// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class symbolBtn extends StatelessWidget {
  final String symbol;
  final Function(String value) display;

  symbolBtn({super.key, required this.symbol, required this.display});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 10,
        color: Theme.of(context).colorScheme.primary,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      onTap: () {
        var value = symbol;
        display(value);
      },
    );
  }
}
