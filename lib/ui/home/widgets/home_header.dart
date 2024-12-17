import 'package:app/ui/auth/blocs/auth_bloc.dart';
import 'package:app/ui/auth/blocs/auth_state.dart';
import 'package:app/ui/home/widgets/percentage_visits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 48,
          top: MediaQuery.of(context).padding.top > 0
              ? MediaQuery.of(context).padding.top + 40
              : 32,
        ),
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  minRadius: 32,
                  child: ClipOval(
                    child: Image.network(
                      state.user!.avatar!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.white,
                        );
                      },
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Olá, ${state.user!.name} 👋',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Catalão, GO',
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: .9)),
                      ),
                    ],
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            const PercentageVisits(),
          ],
        ),
      ),
    );
  }
}
