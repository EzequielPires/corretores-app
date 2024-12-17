import 'package:flutter/material.dart';

class CardScheduling extends StatelessWidget {
  const CardScheduling({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: Colors.white,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Text(
                  'Próxima visita agendada',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black26,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Icon(Icons.edit_square),
                Expanded(
                  child: Text(
                      'Visita agendada com Bruno Maestro no endereço: R. Afonso Pena, 733'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
