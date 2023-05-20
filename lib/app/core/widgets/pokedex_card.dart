// imports nativos
import 'package:flutter/material.dart';

class PokedexCardWidget extends StatelessWidget {
  final Widget body;
  const PokedexCardWidget({ Key? key, required this.body }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 8 ),
          child: body,
        ),
      ),
    );
  }
}
