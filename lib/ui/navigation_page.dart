import 'package:app/ui/agenda/widgets/agenda_page.dart';
import 'package:app/ui/contracts/widgets/contracts_page.dart';
import 'package:app/ui/home/widgets/home_page.dart';
import 'package:app/ui/profile/widgets/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const AgendaPage(),
    const ContractsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        shadowColor: Colors.grey[100],
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: Colors.blueAccent,
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Agenda',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.insert_drive_file,
              color: Colors.white,
            ),
            icon: Icon(Icons.insert_drive_file_outlined),
            label: 'Contratos',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
