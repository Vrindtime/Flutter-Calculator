import 'package:flutter/material.dart';

class NumBtn extends StatelessWidget {
  final String num;
  final Function(String value) display;
  
  NumBtn({super.key, required this.num,required this.display});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 10,
        color: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Text(
            num,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      onTap: () {
        var value = num;
        display(value);
      },
    );
  }
}
