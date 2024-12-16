import 'package:app/ui/auth/blocs/auth_bloc.dart';
import 'package:app/ui/auth/blocs/auth_state.dart';
import 'package:app/ui/auth/signin/widgets/signin_page.dart';
import 'package:app/ui/navigation_page.dart';
import 'package:app/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const NavigationPage();
        } else if (state is Unauthenticated) {
          return const SigninPage();
        }

        return const SplashPage();
      },
    );
  }
}
