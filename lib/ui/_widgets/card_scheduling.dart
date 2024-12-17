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
        child: Column(
          spacing: 16,
          children: [
            const Row(
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
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black12,
            ),
            const Row(
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '10:00 AM - Set 27',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Início',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '10:30 AM - Set 27',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Fim',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
