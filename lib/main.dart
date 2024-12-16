import 'package:app/injections/auth_injection.dart';
import 'package:app/ui/auth/blocs/auth_bloc.dart';
import 'package:app/ui/auth/blocs/auth_event.dart';
import 'package:app/ui/auth/signin/widgets/signin_page.dart';
import 'package:app/ui/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  authInit();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => authInjec<AuthBloc>()
            ..add(
              AuthLoad(),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Corretores',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const InitialPage(),
      ),
    );
  }
}
