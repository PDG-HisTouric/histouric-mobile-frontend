import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget child;

  const NeuBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EDE3), // Fondo suave sepia
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFC0A080), // Sombra oscura sepia
            blurRadius: 20,
            offset: Offset(10, 10),
          ),
          BoxShadow(
            color: Color(0xFFECE1D3), // Sombra clara sepia
            blurRadius: 15,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: child,
    );
  }
}
