import 'package:app/ui/_widgets/circular_progress.dart';
import 'package:flutter/material.dart';

class PercentageVisits extends StatelessWidget {
  const PercentageVisits({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visitas Marcadas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Progresso',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  '27/09/2024',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            CircularProgress(),
          ],
        ),
      ),
    );
  }
}
