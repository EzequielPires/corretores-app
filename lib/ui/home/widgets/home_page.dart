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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              transform: Matrix4.translationValues(0, -24, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: const Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
