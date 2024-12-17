import 'package:app/ui/_widgets/button.dart';
import 'package:app/ui/_widgets/card_scheduling.dart';
import 'package:app/ui/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              transform: Matrix4.translationValues(0, -24, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                spacing: 16,
                children: [
                  const CardScheduling(),
                  Button(
                    label: 'Ver agenda',
                    onPressed: () {},
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
