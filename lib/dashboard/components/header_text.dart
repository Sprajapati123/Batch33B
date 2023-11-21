import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  String? count;
  String? label;
  HeaderText({super.key,required this.count,required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count ?? "n/a"),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(label ?? "n/a"),
        )
      ],
    );
  }
}
