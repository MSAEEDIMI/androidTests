

import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class RundedButten extends StatelessWidget {
  final String titel;
  final Color color;
  final VoidCallback onPreesd;

  const RundedButten({
    required this.color,
    required this.onPreesd,
    required this.titel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Material(
        elevation: 3,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed:onPreesd,
          minWidth: 210.0,
          height: 50.0,
          child: Text(
            titel,
            style: buttmTextStyl,
          ),
        ),
      ),
    );
  }
}